class ProfileController < UserController
    def profile
        find_user
    end
end