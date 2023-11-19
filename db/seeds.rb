names = %w[Віктор Олег Максим Ольга Антоніна Катерина Вікторія Марія Артем Халіма]
surnames = %w[Ревшенко Пеньковський Перетягін Марків Семенюк Підгайна Шимончак Самборська Шевчук Чижик]
phone_numbers = %w[380966534632 380965353564 380965345367 380966420632 380966420632 380966420632 380966420632
                  380966420632 380966420632 380966420632]
positions = %w[Лікар-рентгенолог Лікар-стоматолог Лікар-токсиколог Лікар-терапевт Лікар-хірург Лікар-психолог
               Лікар-нарколог Лікар-кардіолог Лікар-вірусолог Лікар-офтальмолог]


(1..10).each do |index|
  simple_user = User.create!(
    email:    "doctor#{index}@gmail.com",
    password: "doctor#{index}@gmail.com",
    role:     "doctor"
  )

  Doctor.create(
    name: names[index - 1],
    surname: surnames[index - 1],
    photo: File.open("app/assets/images/doctors/doctor-#{index}.png"),
    phone_number: phone_numbers[index - 1],
    position: positions[index - 1],
    experience: rand(2..10),
    user_id: simple_user.id
  )
end
