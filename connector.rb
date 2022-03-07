{
  title: "Fyle",
  connection: {
    authorization: {
      type: "oauth2",

      authorization_url: lambda do
        "https://accounts.fyle.tech/app/developers/%23/oauth/authorize"
      end,

      token_url: lambda do
        "https://accounts.fyle.tech/api/oauth/token"
      end,

      client_id: lambda do
        "FYLE_CLIENT_ID"
      end,

      client_secret: lambda do
        "FYLE_CLIENT_SECRET"
      end,
      
      base_uri: lambda do
        "https://staging.fyle.tech/platform/v1beta"
      end,

      apply: lambda do |connection, access_token|
        headers("Authorization": "Bearer #{access_token}")
      end,

      refresh_on: [401, 403],

      refresh: lambda do |connection, refresh_token|
        response = post("https://accounts.fyle.tech/api/oauth/token").
                      payload(
                        grant_type: "refresh_token",
                        client_id: connection["client_id"],
                        client_secret: connection["client_secret"],
                        refresh_token: refresh_token
                      )
        [
          {
            access_token: response["access_token"],
            refresh_token: response["refresh_token"]
          }
        ]   
      end,
    }
  },
  object_definitions: {
    user: {
      fields: lambda do |connection, config_fields|
        [
          {
            "name": "id"
          },
          {
            "name": "email"
          },
          {
            "name": "full_name"
          }
        ]
      end
    },
    cost_center: {
      fields: lambda do |connection, config_fields|
        [
          {
            "name": "id"
          },
          {
            "name": "name"
          },
          {
            "name": "code"
          }
        ]
      end
    },
    category: {
      fields: lambda do |connection, config_fields|
      [
        {
          "control_type": "number",
          "label": "ID",
          "parse_output": "float_conversion",
          "type": "number",
          "name": "id"
        },
        {
          "control_type": "text",
          "label": "Org ID",
          "type": "string",
          "name": "org_id"
        },
        {
          "control_type": "text",
          "label": "Created at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "created_at"
        },
        {
          "control_type": "text",
          "label": "Updated at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "updated_at"
        },
        {
          "control_type": "text",
          "label": "Name",
          "type": "string",
          "name": "name"
        },
        {
          "control_type": "text",
          "label": "Sub category",
          "type": "string",
          "name": "sub_category"
        },
        {
          "control_type": "text",
          "label": "Is enabled",
          "render_input": {},
          "parse_output": {},
          "toggle_hint": "Select from option list",
          "toggle_field": {
            "label": "Is enabled",
            "control_type": "text",
            "toggle_hint": "Use custom value",
            "type": "boolean",
            "name": "is_enabled"
          },
          "type": "boolean",
          "name": "is_enabled"
        },
        {
          "control_type": "text",
          "label": "Display name",
          "type": "string",
          "name": "display_name"
        },
        {
          "control_type": "text",
          "label": "System category",
          "type": "string",
          "name": "system_category"
        },
        {
          "control_type": "text",
          "label": "Code",
          "type": "string",
          "name": "code"
        }
      ]
      end
    },
    project: {
      fields: lambda do |connection, config_fields|
        [
          {
            "control_type": "number",
            "label": "ID",
            "parse_output": "float_conversion",
            "type": "number",
            "name": "id"
          },
          {
            "control_type": "text",
            "label": "Org ID",
            "type": "string",
            "name": "org_id"
          },
          {
            "control_type": "text",
            "label": "Created at",
            "render_input": "date_time_conversion",
            "parse_output": "date_time_conversion",
            "type": "date_time",
            "name": "created_at"
          },
          {
            "control_type": "text",
            "label": "Updated at",
            "render_input": "date_time_conversion",
            "parse_output": "date_time_conversion",
            "type": "date_time",
            "name": "updated_at"
          },
          {
            "control_type": "text",
            "label": "Name",
            "type": "string",
            "name": "name"
          },
          {
            "control_type": "text",
            "label": "Sub project",
            "type": "string",
            "name": "sub_project"
          },
          {
            "control_type": "text",
            "label": "Code",
            "type": "string",
            "name": "code"
          },
          {
            "control_type": "text",
            "label": "Display name",
            "type": "string",
            "name": "display_name"
          },
          {
            "control_type": "text",
            "label": "Description",
            "type": "string",
            "name": "description"
          },
          {
            "control_type": "text",
            "label": "Is enabled",
            "render_input": {},
            "parse_output": {},
            "toggle_hint": "Select from option list",
            "toggle_field": {
              "label": "Is enabled",
              "control_type": "text",
              "toggle_hint": "Use custom value",
              "type": "boolean",
              "name": "is_enabled"
            },
            "type": "boolean",
            "name": "is_enabled"
          }
        ]
      end
    },
    source_account: {
      fields: lambda do
        [
          {
            "name": "id"
          },
          {
            "name": "type"
          }
        ]
      end
    },
    corporate_card: {
      fields: lambda do |connection, config_fields|
        [
          {
            "control_type": "text",
            "label": "ID",
            "type": "string",
            "name": "id"
          },
          {
            "control_type": "text",
            "label": "Org ID",
            "type": "string",
            "name": "org_id"
          },
          {
            "control_type": "text",
            "label": "User ID",
            "type": "string",
            "name": "user_id"
          },
          {
            "control_type": "text",
            "label": "Created at",
            "render_input": "date_time_conversion",
            "parse_output": "date_time_conversion",
            "type": "date_time",
            "name": "created_at"
          },
          {
            "control_type": "text",
            "label": "Updated at",
            "render_input": "date_time_conversion",
            "parse_output": "date_time_conversion",
            "type": "date_time",
            "name": "updated_at"
          },
          {
            "control_type": "text",
            "label": "Bank name",
            "type": "string",
            "name": "bank_name"
          },
          {
            "control_type": "text",
            "label": "Card number",
            "type": "string",
            "name": "card_number"
          },
          {
            "control_type": "text",
            "label": "Cardholder name",
            "type": "string",
            "name": "cardholder_name"
          },
          {
            "control_type": "text",
            "label": "Data feed source",
            "type": "string",
            "name": "data_feed_source"
          },
          {
            "control_type": "text",
            "label": "Code",
            "type": "string",
            "name": "code"
          },
          {
            "control_type": "text",
            "label": "Last synced at",
            "render_input": "date_time_conversion",
            "parse_output": "date_time_conversion",
            "type": "date_time",
            "name": "last_synced_at"
          },
          {
            "control_type": "text",
            "label": "Last assigned at",
            "render_input": "date_time_conversion",
            "parse_output": "date_time_conversion",
            "type": "date_time",
            "name": "last_assigned_at"
          },
          {
            "control_type": "text",
            "label": "Assignor user ID",
            "type": "string",
            "name": "assignor_user_id"
          },
          {
            "control_type": "text",
            "label": "Is visa enrolled",
            "render_input": {},
            "parse_output": {},
            "toggle_hint": "Select from option list",
            "toggle_field": {
              "label": "Is visa enrolled",
              "control_type": "text",
              "toggle_hint": "Use custom value",
              "type": "boolean",
              "name": "is_visa_enrolled"
            },
            "type": "boolean",
            "name": "is_visa_enrolled"
          },
          {
            "control_type": "text",
            "label": "Is dummy",
            "render_input": {},
            "parse_output": {},
            "toggle_hint": "Select from option list",
            "toggle_field": {
              "label": "Is dummy",
              "control_type": "text",
              "toggle_hint": "Use custom value",
              "type": "boolean",
              "name": "is_dummy"
            },
            "type": "boolean",
            "name": "is_dummy"
          },
          {
            "control_type": "text",
            "label": "Last ready for verification at",
            "render_input": "date_time_conversion",
            "parse_output": "date_time_conversion",
            "type": "date_time",
            "name": "last_ready_for_verification_at"
          },
          {
            "control_type": "text",
            "label": "Last verification attempt at",
            "render_input": "date_time_conversion",
            "parse_output": "date_time_conversion",
            "type": "date_time",
            "name": "last_verification_attempt_at"
          },
          {
            "control_type": "text",
            "label": "Last verified at",
            "render_input": "date_time_conversion",
            "parse_output": "date_time_conversion",
            "type": "date_time",
            "name": "last_verified_at"
          },
          {
            "control_type": "text",
            "label": "Verification status",
            "type": "string",
            "name": "verification_status"
          }
        ]
      end
    },
    expense: {
      fields: lambda do |connection, config_fields|
       [
        {
          "control_type": "text",
          "label": "ID",
          "type": "string",
          "name": "id"
        },
        {
          "control_type": "text",
          "label": "User ID",
          "type": "string",
          "name": "user_id"
        },
        {
          "control_type": "text",
          "label": "User email",
          "type": "string",
          "name": "user_email"
        },
        {
          "control_type": "text",
          "label": "User full name",
          "type": "string",
          "name": "user_full_name"
        },
        {
          "control_type": "text",
          "label": "Org ID",
          "type": "string",
          "name": "org_id"
        },
        {
          "control_type": "text",
          "label": "Created at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "created_at"
        },
        {
          "control_type": "text",
          "label": "Updated at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "updated_at"
        },
        {
          "control_type": "text",
          "label": "Spent at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "spent_at"
        },
        {
          "control_type": "text",
          "label": "Source",
          "type": "string",
          "name": "source"
        },
        {
          "control_type": "text",
          "label": "Merchant",
          "type": "string",
          "name": "merchant"
        },
        {
          "control_type": "text",
          "label": "Currency",
          "type": "string",
          "name": "currency"
        },
        {
          "control_type": "number",
          "label": "Amount",
          "parse_output": "float_conversion",
          "type": "number",
          "name": "amount"
        },
        {
          "control_type": "text",
          "label": "Foreign currency",
          "type": "string",
          "name": "foreign_currency"
        },
        {
          "control_type": "number",
          "label": "Foreign amount",
          "parse_output": "float_conversion",
          "type": "number",
          "name": "foreign_amount"
        },
        {
          "control_type": "text",
          "label": "Purpose",
          "type": "string",
          "name": "purpose"
        },
        {
          "control_type": "number",
          "label": "Cost center ID",
          "parse_output": "float_conversion",
          "type": "number",
          "name": "cost_center_id"
        },
        {
          "control_type": "text",
          "label": "Cost center name",
          "type": "string",
          "name": "cost_center_name"
        },
        {
          "control_type": "text",
          "label": "Cost center code",
          "type": "string",
          "name": "cost_center_code"
        },
        {
          "control_type": "number",
          "label": "Category ID",
          "parse_output": "float_conversion",
          "type": "number",
          "name": "category_id"
        },
        {
          "control_type": "text",
          "label": "Category name",
          "type": "string",
          "name": "category_name"
        },
        {
          "control_type": "text",
          "label": "Sub category",
          "type": "string",
          "name": "sub_category"
        },
        {
          "control_type": "text",
          "label": "Category code",
          "type": "string",
          "name": "category_code"
        },
        {
          "control_type": "number",
          "label": "Project ID",
          "parse_output": "float_conversion",
          "type": "number",
          "name": "project_id"
        },
        {
          "control_type": "text",
          "label": "Project name",
          "type": "string",
          "name": "project_name"
        },
        {
          "control_type": "text",
          "label": "Sub project",
          "type": "string",
          "name": "sub_project"
        },
        {
          "control_type": "text",
          "label": "Project code",
          "type": "string",
          "name": "project_code"
        },
        {
          "control_type": "text",
          "label": "Source account ID",
          "type": "string",
          "name": "source_account_id"
        },
        {
          "control_type": "text",
          "label": "Source account type",
          "type": "string",
          "name": "source_account_type"
        },
        {
          "control_type": "number",
          "label": "Tax amount",
          "parse_output": "float_conversion",
          "type": "number",
          "name": "tax_amount"
        },
        {
          "control_type": "text",
          "label": "Tax group ID",
          "type": "string",
          "name": "tax_group_id"
        },
        {
          "control_type": "text",
          "label": "Is billable",
          "render_input": {},
          "parse_output": {},
          "toggle_hint": "Select from option list",
          "toggle_field": {
            "label": "Is billable",
            "control_type": "text",
            "toggle_hint": "Use custom value",
            "type": "boolean",
            "name": "is_billable"
          },
          "type": "boolean",
          "name": "is_billable"
        },
        {
          "control_type": "text",
          "label": "Is reimbursable",
          "render_input": {},
          "parse_output": {},
          "toggle_hint": "Select from option list",
          "toggle_field": {
            "label": "Is reimbursable",
            "control_type": "text",
            "toggle_hint": "Use custom value",
            "type": "boolean",
            "name": "is_reimbursable"
          },
          "type": "boolean",
          "name": "is_reimbursable"
        },
        {
          "control_type": "text",
          "label": "Code",
          "type": "string",
          "name": "code"
        },
        {
          "control_type": "text",
          "label": "State",
          "type": "string",
          "name": "state"
        },
        {
          "control_type": "text",
          "label": "Seq num",
          "type": "string",
          "name": "seq_num"
        },
        {
          "control_type": "text",
          "label": "Added to report at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "added_to_report_at"
        },
        {
          "control_type": "text",
          "label": "Report ID",
          "type": "string",
          "name": "report_id"
        },
        {
          "control_type": "text",
          "label": "Report last approved at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "report_last_approved_at"
        },
        {
          "control_type": "text",
          "label": "Report last submitted at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "report_last_submitted_at"
        },
        {
          "control_type": "text",
          "label": "Report seq num",
          "type": "string",
          "name": "report_seq_num"
        },
        {
          "control_type": "text",
          "label": "Report title",
          "type": "string",
          "name": "report_title"
        },
        {
          "control_type": "text",
          "label": "Report state",
          "type": "string",
          "name": "report_state"
        },
        {
          "control_type": "text",
          "label": "Report settlement ID",
          "type": "string",
          "name": "report_settlement_id"
        },
        {
          "control_type": "text",
          "label": "Report last paid at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "report_last_paid_at"
        },
        {
          "control_type": "text",
          "label": "Is verified",
          "render_input": {},
          "parse_output": {},
          "toggle_hint": "Select from option list",
          "toggle_field": {
            "label": "Is verified",
            "control_type": "text",
            "toggle_hint": "Use custom value",
            "type": "boolean",
            "name": "is_verified"
          },
          "type": "boolean",
          "name": "is_verified"
        },
        {
          "control_type": "text",
          "label": "Last verified at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "last_verified_at"
        },
        {
          "control_type": "text",
          "label": "Is exported",
          "render_input": {},
          "parse_output": {},
          "toggle_hint": "Select from option list",
          "toggle_field": {
            "label": "Is exported",
            "control_type": "text",
            "toggle_hint": "Use custom value",
            "type": "boolean",
            "name": "is_exported"
          },
          "type": "boolean",
          "name": "is_exported"
        },
        {
          "control_type": "text",
          "label": "Last exported at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "last_exported_at"
        },
        {
          "control_type": "text",
          "label": "Employee ID",
          "type": "string",
          "name": "employee_id"
        },
        {
          "control_type": "text",
          "label": "Employee code",
          "type": "string",
          "name": "employee_code"
        },
        {
          "control_type": "text",
          "label": "Employee department ID",
          "type": "string",
          "name": "employee_department_id"
        },
        {
          "control_type": "text",
          "label": "Employee department code",
          "type": "string",
          "name": "employee_department_code"
        },
        {
          "control_type": "text",
          "label": "Employee department name",
          "type": "string",
          "name": "employee_department_name"
        },
        {
          "control_type": "text",
          "label": "Employee sub department name",
          "type": "string",
          "name": "employee_sub_department_name"
        },
        {
          "control_type": "text",
          "label": "Is corporate card transaction auto matched",
          "render_input": {},
          "parse_output": {},
          "toggle_hint": "Select from option list",
          "toggle_field": {
            "label": "Is corporate card transaction auto matched",
            "control_type": "text",
            "toggle_hint": "Use custom value",
            "type": "boolean",
            "name": "is_corporate_card_transaction_auto_matched"
          },
          "type": "boolean",
          "name": "is_corporate_card_transaction_auto_matched"
        },
        {
          "control_type": "text",
          "label": "Corporate card ID",
          "type": "string",
          "name": "corporate_card_id"
        },
        {
          "control_type": "text",
          "label": "Corporate card number",
          "type": "string",
          "name": "corporate_card_number"
        },
        {
          "control_type": "text",
          "label": "Last settled at",
          "render_input": "date_time_conversion",
          "parse_output": "date_time_conversion",
          "type": "date_time",
          "name": "last_settled_at"
        }
        ]
      end
    }
  },
  actions: {
    get_list_of_expenses: {
      execute: lambda do |connection, input|
        expenses = get("https://staging.fyle.tech/platform/v1beta/admin/expenses")['data']
        flattened_expenses = call(:flatten_expenses, expenses)
      end,
      output_fields: lambda do |object_definitions|
       [
          {
            name: "data",
            label: "Expenses",
            type: :array,
            of: :object,
            properties: object_definitions["expense"]
          }
        ]
      end
    },
    get_list_of_categories: {
      execute: lambda do |connection, input|
        categories = get("https://staging.fyle.tech/platform/v1beta/admin/categories")
      end,
      output_fields: lambda do |object_definitions|
       [
          {
            name: "data",
            label: "Categories",
            type: :array,
            of: :object,
            properties: object_definitions["category"]
          }
        ]
      end
    },
    get_list_of_projects: {
      execute: lambda do |connection, input|
        projects = get("https://staging.fyle.tech/platform/v1beta/admin/projects")
      end,
      output_fields: lambda do |object_definitions|
       [
          {
            name: "data",
            label: "Projects",
            type: :array,
            of: :object,
            properties: object_definitions["project"]
          }
        ]
      end
    },
    get_list_of_corporate_cards: {
      execute: lambda do |connection, input|
        corporate_cards = get("https://staging.fyle.tech/platform/v1beta/admin/corporate_cards")
      end,
      output_fields: lambda do |object_definitions|
       [
          {
            name: "data",
            label: "Corporate Cards",
            type: :array,
            of: :object,
            properties: object_definitions["corporate_card"]
          }
        ]
      end
    }
  },
  triggers: {},
  pick_lists: {},
  methods: {
    flatten_expenses: lambda do |input|
      flattened_expenses = []
      input.each { |expense|
        flattened_expenses.push({
          id: expense['id'],
          user_id: expense['user_id'],
          user_email: expense['user']['email'],
          user_full_name: expense['user']['full_name'],
          org_id: expense['org_id'],
          created_at: expense['created_at'],
          updated_at: expense['updated_at'],
          spent_at: expense['spent_at'],
          source: expense['source'],
          merchant_id: expense['merchant_id'],
          currency_code: expense['currency_code'],
          amount: expense['amount'],
          foreign_currency: expense['foreign_currency'],
          foreign_amount: expense['foreign_amount'],
          purpose: expense['purpose'],
          cost_center_id: expense['cost_center_id'],
          cost_center_name: expense['cost_center'] ? expense['cost_center']['name'] : nil,
          cost_center_code: expense['cost_center'] ? expense['cost_center']['code'] : nil,
          category_id: expense['category_id'],
          category_name: expense['category'] ? expense['category']['name'] : nil,
          sub_category: expense['category'] ? expense['category']['sub_category'] : nil,
          categor_code: expense['category'] ? expense['category']['code'] : nil,
          project_id: expense['project_id'],
          project_name: expense['project'] ? expense['project']['name'] : nil,
          project_code: expense['project'] ? expense['project']['code'] : nil,
          sub_project: expense['project'] ? expense['project']['sub_project'] : nil,
          source_account_id: expense['source_account_id'],
          source_account_type: expense['source_account'] ? expense['source_account']['type'] : nil,
          tax_amount: expense['tax_amount'],
          tax_group_id: expense['tax_group_id'],
          is_billable: expense['is_billable'],
          is_reimbursable: expense['is_reimbursable'],
          state: expense['state'],
          expense_number: expense['seq_num'],
          added_to_report_at: expense['added_to_report_at'],
          report_id: expense['report_id'],
          report_last_approved_at: expense['report'] ? expense['report']['last_approved_at'] : nil,
          report_last_submitted_at: expense['report'] ? expense['report']['last_submitted_at'] : nil,
          report_number: expense['report'] ? expense['report']['seq_num'] : nil,
          report_title: expense['report'] ? expense['report']['title'] : nil,
          report_state: expense['report'] ? expense['report']['state'] : nil,
          settlement_id: expense['report'] ? expense['report']['settlement_id'] : nil,
          report_last_paid_at: expense['report'] ? expense['report']['last_paid_at'] : nil,
          is_verified: expense['is_verified'],
          last_verified_at: expense['last_verified_at'],
          is_exported: expense['is_exported'],
          last_exported_at: expense['last_exported_at'],
          employee_id: expense['employee_id'],
          employee_code: expense['employee']['code'],
          employee_department_id: expense['employee']['department'] ? expense['employee']['department']['id'] : nil,
          employee_department_code: expense['employee']['department'] ? expense['employee']['department']['code'] : nil,
          employee_department_name: expense['employee']['department'] ? expense['employee']['department']['name'] : nil,
          employee_sub_department_name: expense['employee']['department'] ? expense['employee']['department']['sub_department'] : nil,
          is_corporate_card_transaction_auto_matched: expense['is_corporate_card_transaction_auto_matched'],
          corporate_card_id: expense['matched_corporate_card_transactions'][0] ? expense['matched_corporate_card_transactions'][0]['corporate_card_id'] : nil,
          corporate_card_number: expense['matched_corporate_card_transactions'][0] ? expense['matched_corporate_card_transactions'][0]['corporate_card_number'] : nil,
          last_settled_at: expense['last_settled_at']
        })
      }
      {
        data: flattened_expenses
      }
    end
  }
}