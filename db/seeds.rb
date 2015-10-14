endereco = Address.create(street: 'Rua',
                          number: 1877,
                          neighborhood: 'tristeza',
                          city: 'porto alegre',
                          state: 'rs',
                          zip: '91920000')

ivonei = Person.create(name:'Ivonei',
                      last_name:'Junior',
                      registry:'02426147016',
                      sex:'M',
                      phone:'5191879477',
                      address_id: endereco.id)

admin = User.create(username: 'ivonei.marques',
                    email: 'ivonei.marques@zeta.com.br',
                    password: 'ivonei.marques',
                    token:'3c897fa3098770eef3ed71e314d4c2b1',
                    activated: true,
                    person_id: ivonei.id)
