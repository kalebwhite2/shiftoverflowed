# email: string
# password_digest: string
#
# password: string virtual
# password_confirmation: string virtual

class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: {with: /\A[^\s]+[@][^\s]+[.][^\s]+/, message: "Must be in the format *@*.*"}
    validates :password, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
end
