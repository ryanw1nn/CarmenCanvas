admin_user = User.find_or_create_by(name: "admin") do |user|
  user.admin = true
  user.password = "cse3901!"  # Set the password for the admin user
  user.password_confirmation = "cse3901!"  # Confirm the password
  user.save if user.new_record? # Save the user if it's a new record
end

# Ensure all other users have admin = false
User.where.not(name: "admin").update_all(admin: false)
