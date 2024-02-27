class Current < ActiveSupport::CurrentAttributes
  # If someone's logged in, then Current.user will be their id
  # Else, it'll be nil
  # It'll be separate for each person logged in
  attribute :user

end