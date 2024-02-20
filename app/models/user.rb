# email: string
# password_digest: string
# first_name: string
# last_name: string
#
# password: string virtual
# password_confirmation: string virtual

class User < ApplicationRecord
    has_secure_password

    # Each user has_one weekly_availability
    has_one :weekly_availability
    
    # Check email against regex. Breaking this down:
        # \A is start of string. [^\s] means any character except (^) whitespace (\s).
        # + indicates one or more of any character except whitespace.
        # [@] means a single character of '@'.
        # [.] means a single character of '.'.
    validates :email, format: {with: /\A[^\s]+[@][^\s]+[.][^\s]+/, message: "must be in the format *@*.*"}
    # Active record validations contains this simple validator to check uniqueness
    validates :email, uniqueness: true
    validates :first_name, :last_name, :email, presence: true
end