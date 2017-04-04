# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "------Cadastrando as CATEGORIAS...------"

      categories = [  "Animais e Acessórios",
                              "Esportes",
                              "Para a sua casa",
                              "Eletrônicos e Celulares",
                              "Músicas e Hobbie",
                              "Bebês e Crianças",
                              "Moda e Beleza",
                              "Veículos e Barcos",
                              "Imóveis",
                              "Empregos e Negócios"]

      categories.each do |category|
        Category.friendly.find_or_create_by(description: category)
      end

puts "CATEGORIAS Cadastradas com Sucesso!"

######################################
puts "Cadastrando ADMINISTRADOR Padrão..."

      Admin.create!(
            name: "Administrador Padrão",
            email: "admin@admin.com",
            password: "123456",
            password_confirmation: "123456",
            role: 0
      )

puts "ADMINISTRADOR Cadastrado com Sucesso!"

####################################
puts "Cadastrando MEMBRO Padrão..."

      member = Member.new(
            email: "membro@membro.com",
            password: "123456",
            password_confirmation: "123456"
            )
            member.build_profile_member

            member.profile_member.first_name = Faker::Name.first_name
            member.profile_member.second_name = Faker::Name.last_name

        member.save!

puts "MEMBRO Cadastrado com Sucesso!"
