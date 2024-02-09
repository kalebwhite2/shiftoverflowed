# email: string
# password_digest: string
# first_name: string
# last_name: string
#
# password: string virtual
# password_confirmation: string virtual

class User < ApplicationRecord
    has_secure_password
    
    validates :email, format: {with: /\A[^\s]+[@][^\s]+[.][^\s]+/, message: "must be in the format *@*.*"}
    validates :email, uniqueness: true
    validates :first_name, :last_name, :email, presence: true
end
