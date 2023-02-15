# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def create_table_values
    User.create(user_name: "kevin0123399",
                email: "kevinclarkgta@gmail.com",
                password: "131619",
                password_confirmation: "131619",
                role: 2
            )
    User.create(user_name: "John Doe",
                email: "jd@gmail.com",
                password: "jd@131619",
                password_confirmation: "jd@131619",
                role: 0
            )

    Category.create(
        name: "Education",
        description: "Contents about education"
    )
    Category.create(
        name: "Programming",
        description: "Contents about Programming"
    )
end

create_table_values