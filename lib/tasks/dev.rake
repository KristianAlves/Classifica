namespace :dev do

desc "Setup Development"
task setup: :environment do
    images_path = Rails.root.join('public','system')

    puts "Executando o setup para desenvolvimento"

    puts "Apagando Banco de Dados...#{%x(rake db:drop)}"

    if Rails.env.development?
      puts "Apagando Imagens de Public/System... #{%x(rm -rf #{images_path})}"
    end

    puts "Criando Banco de Dados... #{%x(rake db:create)}"
    puts "Migrando Banco de Dados... #{%x(rake db:migrate)}"
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_ads)
    puts %x(rake dev:generate_comments)

    puts "Setup realizado com sucesso!"
  end



######################

desc "Cria Administrador Fake"
task generate_admins: :environment do
  puts "Cadastrando ADMINISTRADORES..."

    10.times do
      Admin.create!(
          email: Faker::Internet.email,
          password: "123456",
          password_confirmation: "123456",
          name: Faker::Name.name,
          role: [0,1,1,1,1].sample
        )
    end

    puts "ADMINISTRADORES cadastrados com sucesso!"
  end


#####################

desc "Cria Membro Fake"
task generate_members: :environment do
  puts "Cadastrando MEMBRO..."

    100.times do
      member = Member.new(
          email: Faker::Internet.email,
          password: "123456",
          password_confirmation: "123456"
        )
        member.build_profile_member

        member.profile_member.first_name = Faker::Name.first_name
        member.profile_member.second_name = Faker::Name.last_name

        member.save!
    end
        puts "MEMBROS cadastrados com sucesso!"
  end

######################

  desc "Cria Anúncios Fakes"
  task generate_ads: :environment do
  puts "Cadastrando ANÚNCIOS..."

      5.times do
        Ad.create!(
          title: Faker::Lorem.sentence([2,3,4,5].sample),
          description_short: Faker::Lorem.sentence([2,3].sample),
          description_md: markdown_fake,
          member: Member.first,
          category: Category.all.sample,
          price: "#{Random.rand(500)}, #{Random.rand(99)}",
                    finish_date: Date.today + Random.rand(90),
          picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
          )
      end

      100.times do
        Ad.create!(
          title: Faker::Lorem.sentence([2,3,4,5].sample),
          description_short: Faker::Lorem.sentence([2,3].sample),
          description_md: markdown_fake,
          member: Member.all.sample,
          category: Category.all.sample,
          finish_date: Date.today + Random.rand(90),
          price: "#{Random.rand(500)}, #{Random.rand(99)}",
          picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
          )
      end
      puts "Anúncios cadastrados com sucesso!"
    end

    def markdown_fake
      %x(ruby -e "require 'doctor_ipsum';  puts DoctorIpsum::Markdown.entry")
    end

#####################

desc "Cria Comentário Fake"
task generate_comments: :environment do
  puts "Cadastrando COMENTÁRIOS..."

      Ad.all.each do |ad|
        (Random.rand(3)).times do
          Comment.create!(
            body: Faker::Lorem.paragraph([1,2,3].sample),
            member:Member.all.sample,
            ad: ad
            )
        end
    end
        puts "COMENTÁRIOS cadastrados com sucesso!"
  end
end