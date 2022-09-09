# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
User.create name: 'Mr Admin', email: 'admin@email.com', 
            profile: 'admin',
            password: '12345678', password_confirmation: '12345678', 
            active: true
