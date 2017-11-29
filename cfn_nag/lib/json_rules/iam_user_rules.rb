violation id: 'F10',
          jq: '[.Resources|with_entries(.value.LogicalResourceId = .key)[] | select(.Type == "AWS::IAM::User")|'\
              'select(.Properties.Policies|length > 0)]|map(.LogicalResourceId) ',
          message: 'IAM user should not have any directly attached policies.  Should be on group'

violation id: 'F11',
          jq: '[.Resources|with_entries(.value.LogicalResourceId = .key)[] | select(.Type == "AWS::IAM::Policy")|'\
              'select(.Properties.Users|length > 0)]|map(.LogicalResourceId) ',
          message: 'IAM policy should not apply directly to users.  Should be on group'

violation id: 'F12',
          jq: '[.Resources|with_entries(.value.LogicalResourceId = .key)[] | select(.Type == "AWS::IAM::ManagedPolicy")|'\
              'select(.Properties.Users|length > 0)]|map(.LogicalResourceId) ',
          message: 'IAM managed policy should not apply directly to users.  Should be on group'

