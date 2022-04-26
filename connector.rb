{
  title: 'Fyle Production',

  # API key authentication example. See more examples at https://docs.workato.com/developing-connectors/sdk/guides/authentication.html
  connection: {
    authorization: {

      type: "oauth2",

      authorization_url: lambda do
        'https://accounts.fylehq.com/app/developers/%23/oauth/authorize'
      end,

      token_url: lambda do
        'https://accounts.fylehq.com/api/oauth/token'
      end,

      base_uri: lambda do |connection|
        account_property('PRODUCTION_BASE_URL')
      end,

      client_id: lambda do |connection|
        account_property('PRIODUCTION_CLIENT_ID')
      end,

      client_secret: lambda do |connection|
        account_property('PRODUCTION_CLIENT_SECRET')
      end,

      apply: lambda do |connection, access_token|
        headers("Authorization": "Bearer #{access_token}")
      end,

      refresh_on: [401, 403, '401 Authorization Required'],
 
      refresh: lambda do |connection, refresh_token|
        response = post('https://accounts.fylehq.com/api/oauth/token').
          payload(
            grant_type: 'refresh_token',
            client_id: account_property('PRIODUCTION_CLIENT_ID'),
            client_secret: account_property('PRODUCTION_CLIENT_SECRET'),
            refresh_token: refresh_token
          )
      end,
    },
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
            "control_type": "number",
            "label": "ID",
            "parse_output": "float_conversion",
            "type": "number",
            "name": "id"
          },
          {
            "control_type": "text",
            "label": "Name",
            "type": "string",
            "name": "name"
          },
          {
            "control_type": "text",
            "label": "Code",
            "type": "string",
            "name": "code"
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
    get_list_of_categories: {
      execute: lambda do |connection, input|
        categories = get('https://in1.fylehq.com/platform/v1beta/admin/categories')
      end,
      output_fields: lambda do |object_definitions|
        [
          {
            name: 'data',
            label: 'Categories',
            type: :array,
            of: :object,
            properties: object_definitions['category']
          }
        ]
      end
    },
    get_list_of_expenses: { 
      input_fields: lambda do
          [
            { 
              name: 'state', 
              type: :string, 
              optional: false 
            },
            {
              name: 'order',
              type: :string,
              optional: false
            },
            {
              name: 'updated_at',
              type: :string,
              optional: false
            },
            {
              name: 'exported',
              type: :string,
              optional: false
            }
          ]
      end,
 
      execute: lambda do |connection, input_fields|
        expenses = call(:paginated_get_all, input_fields)
       
      end,
      output_fields: lambda do |object_definitions|
        [
          {
            name: 'data',
            label: 'Expenses',
            type: :array,
            of: :object,
            properties: object_definitions['expense']
          }
        ]
      end
    },
    get_list_of_cost_centers: {
      execute: lambda do |connection, input|
        categories = get('https://in1.fylehq.com/platform/v1beta/admin/cost_centers')
      end,
      output_fields: lambda do |object_definitions|
        [
          {
            name: 'data',
            label: 'Cost Centers',
            type: :array,
            of: :object,
            properties: object_definitions['cost_center']
          }
        ]
      end
    },
    upload_to_fyle: {
      input_fields: lambda do
        [
          {
            "name": "limeitem_data",
            "type": "array",
            "of": "object",
            "label": "Rows",
            "properties": [
              {
                "control_type": "text",
                "label": "Object ID",
                "type": "string",
                "name": "object_id"
              },
              {
                "control_type": "text",
                "label": "Object type",
                "type": "string",
                "name": "object_type"
              },
              {
                "control_type": "text",
                "label": "Reference",
                "type": "string",
                "name": "reference"
              }
            ]
          }
        ]
      end,
      
      execute: lambda do |connection, input_fields|
        add_accounting_export = call(:upload_accounting_export, input_fields) 
      end
    },
    upload_categories_to_fyle: {
       execute: lambda do |connection|
        fyle_payload = [
          {
            'name': 'Jhon Cena 11',
            'code': 141199,
            'enabled': true
          }
        ]
        categories = get('https://in1.fylehq.com/platform/v1beta/admin/cost_centers')
      end
    }
  },

  triggers: {
    new_updated_cost_center: {
      title: 'New/Updated Cost Center',

      subtitle: "Triggers when a Cost Center is created or " \
      "updated in Fyle",
      
      description: lambda do |input, picklist_label|
        "New/updated <span class='provider'>Cost Center</span> " \
        "in <span class='provider'>Fyle</span>"
      end,

      help: "Creates a job when cost centers are created or " \
      "updated in Fyle. Each cost center creates a separate job.",
      
      input_fields: lambda do |object_definitions|
        [
          {
            name: 'since',
            label: 'When first started, this recipe should pick up events from',
            type: 'timestamp',
            optional: true,
            sticky: true,
            hint: 'When you start recipe for the first time, it picks up ' \
              'trigger events from this specified date and time. Defaults to ' \
              'the current time.'
          }
        ]
      end,
      
      poll: lambda do |connection, input, closure, _eis, _eos|
        
        closure = {} unless closure.present?
        limit = 100
        
        updated_since = (closure['cursor'] || input['since'] || Time.now ).to_time.utc.iso8601
        

        cost_center = get('https://in1.fylehq.com/platform/v1beta/admin/cost_centers').
                  params(
                    'order': 'updated_at.asc',
                  )
        closure['cursor'] = cost_center['data'].last['updated_at'] unless cost_center.blank?
        
        {
          events: cost_center,
          next_poll: closure,
          can_poll_more: false
        }
        
      end,
      
      dedup: lambda do |record|
        "#{record['data'].last['id']}@#{record['data'].last['created_at']}"
      end,
       output_fields: lambda do |object_definitions|
          [
            {
              name: 'data',
              label: 'Cost Centers',
              type: :array,
              of: :object,
              properties: object_definitions['cost_center']
            }
          ]
      end
    },
    new_expenses: {
      title: 'New/Updated Expense',

      subtitle: "Triggers when a expense is created or " \
      "updated in Fyle",
      
      description: lambda do |input, picklist_label|
        "New <span class='provider'>Expense</span> " \
        "in <span class='provider'>Fyle</span>"
      end,

      help: "Creates a job when Expense are created " \
      "in Fyle. Each expense creates a separate job.",
 
      input_fields: lambda do
        [
          {
            name: 'since',
            label: 'When first started, this recipe should pick up events from',
            type: 'timestamp',
            optional: true,
            sticky: true,
            hint: 'When you start recipe for the first time, it picks up ' \
              'trigger events from this specified date and time. Defaults to ' \
              'the current time.'
          },
          { 
            name: 'state', 
            type: :string, 
            optional: false 
          },
          {
            name: 'order',
            type: :string,
            optional: false
          },
          {
            name: 'updated_at',
            type: :string,
            optional: false
          },
          {
            name: 'exported',
            type: :string,
            optional: false
          }
        ]
      end,
 
      poll: lambda do |connection, input, closure, _eis, _eos|
        
        closure = {} unless closure.present?
        limit = 100
        
        updated_since = (closure['cursor'] || input['since'] || Time.now ).to_time.utc.iso8601
        

        expenses = get('https://in1.fylehq.com/platform/v1beta/admin/expenses').
                  params(
                    'state': 'eq.PAYMENT_PROCESSING',
                    'order': 'updated_at.asc'
                  )
  
        closure['cursor'] = expenses['data'].last['updated_at'] unless expenses.blank?
        
        {
          events: expenses,
          next_poll: closure,
          can_poll_more: false
        }
        
      end,
      
      dedup: lambda do |record|
        "#{record['data'].last['id']}@#{record['data'].last['created_at']}"
      end,
       output_fields: lambda do |object_definitions|
          [
            {
              name: 'data',
              label: 'Expense',
              type: :array,
              of: :object,
              properties: object_definitions['expense']
            }
          ]
      end
    },
  },

  pick_lists: {
  },

  # Reusable methods can be called from object_definitions, picklists or actions
  # See more at https://docs.workato.com/developing-connectors/sdk/sdk-reference/methods.html
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
          category_code: expense['category'] ? expense['category']['code'] : nil,
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
          seq_num: expense['seq_num'],
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
    end,
    upload_accounting_export: lambda do |input_fields|
      user_profile = call(:get_user_profile) 

      file_payload = {
        "data": {
          "name": 'Test Fyle Name',
          "type": "INTEGRATION",
          "password": nil,
          "user_id": user_profile['id']
        }
      }

      type = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'

      file_obj = post('https://in1.fylehq.com/platform/v1beta/admin/files', file_payload)

      file_id = file_obj['data']['id']

      if input_fields['limeitem_data']
        accounting_exports_payload =   {
          "data": {
            "file_ids": [
              file_id
            ],
            "exported_at": Time.now(),
            "description": "TST Foundation CSV Export - 2",
            "name": "TST Foundation CSV Export"
          }
        }
        accounting_export = post('https://in1.fylehq.com/platform/v1beta/admin/accounting_exports', accounting_exports_payload)
        accounting_export_id = accounting_export['data']['id']

        input_fields['limeitem_data'].each_with_object({}) do |element, hash|
          element[:accounting_export_id] = accounting_export_id
        end

        accounting_export_line_items_payload = {
          "data": input_fields['limeitem_data']
        }

        accounting_export_lineitems = post('https://in1.fylehq.com/platform/v1beta/admin/accounting_export_lineitems/bulk', accounting_export_line_items_payload)
        accounting_export_lineitems

      end

    end,
    output_fields: lambda do |object_definitions|
      [
        {
          name: 'data',
          label: 'Expenses',
          type: :array,
          of: :object,
          properties: object_definitions['user']
        }
      ]
    end,  
    get_user_profile: lambda do
        user_profile = get('https://in1.fylehq.com/platform/v1beta/spender/my_profile')['data']['user']

        user_profile
    end,
    paginated_get_all: lambda do |input|
      count = 1
      total_count = 0
      results = []
      
      query_params = {
        order: input['order'],
        state: input['state'],
        is_exported: input['exported'],
        updated_at: input['updated_at']
      }

      while total_count < count  do
        response = get('https://in1.fylehq.com/platform/v1beta/admin/expenses').params(
          query_params
        )
        
        data_size = response['data'].length()
        total_count = total_count + data_size
        count = response['count']
        
        query_params = {
           order: input['order'],
           state: input['state'],
          'offset': total_count, 
          'limit': data_size
        }
        
        results = results + response['data']
     
      end
      flattened_expenses = call(:flatten_expenses, results)
      
      flattened_expenses
    end
  }
}