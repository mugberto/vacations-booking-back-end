![](https://img.shields.io/badge/microverse-blueviolet)

# Vacations booking back-end

> "Vacations booking back-end" project is a Rails API application which provide the API endpoints for creating/removing different destinations by admin users and creating reservations by other logged users. We were using Swagger to create API documentation. You can check it here - [API documentation](https://booking-vacations.herokuapp.com/api-docs/index.html).

![image](https://user-images.githubusercontent.com/63932912/143224920-5cc44446-f6f1-47ee-b737-78e24e5613f7.png)

## Live demo link

[Demo link](https://booking-vacations.herokuapp.com/api-docs/index.html)

## Kanban board

[Link to Kanban board](https://github.com/mugberto/vacations-booking-back-end/projects/1)

Kanban boad setup screenshoot:
![Kanban-board-screenshot](https://user-images.githubusercontent.com/63932912/143473675-9f4385ab-1f78-45df-99f7-724196a39538.png)

The final member number of this project is: 5!



## Built With

- Ruby on Rails
- Postgres
- Rspec
- Swagger


## Getting Started

To get a local copy up and run the app, follow these simple example steps.

### Prerequisites

- Ruby > 2.7.3
- Rails > 6.1.4.1
- Postgres > 14.0

### Setup

Clone the repository with:

```
git clone git@github.com:mugberto/vacations-booking-back-end.git
```
or download [ZIP file](https://github.com/mugberto/vacations-booking-back-end/archive/refs/heads/dev.zip)

### Install
To install all dependencies, run:
```
bundle install
```
Create database and seed the data
```
rails db:create
rails db:migrate
rails db:seed
```
### Usage
To run the server, in the project directory, run:

 ```
 rails s
 ```
 
### Endpoints
If you are using the app localy 
```
{defaultHost} = http://localhost:3000
```
If you are using deployed app
```
{defaultHost} = https://booking-vacations.herokuapp.com
```
- Create a new user: `POST` `{defaultHost}/api/v1/users `
- Authenticates the user: `POST` `{defaultHost}/api/v1/users/sign_in`
- Creates a new destination: `POST` `{defaultHost}/api/v1/destinations`
- Retreives destinations: `GET` `{defaultHost}/api/v1/destinations`
- Removes destination: `DELETE` `{defaultHost}/api/v1/destinations/{id}`
- Creates a new reservation: `POST` `{defaultHost}/api/v1/reservations`
- Retreives reservations: `GET` `{defaultHost}/api/v1/reservations`
- Removes a reservation: `DELETE` `{defaultHost}/api/v1/reservations/{id}`

### Tests

To test endpoins please run:
```
rails rswag
```

To test the models please run:
```
rspec --exclude-pattern "spec/{requests}/**/*_spec.rb"
```

#### Testing in browser
If you prefere do testings in graphic environment, in your browser open 
```
{defaultHost}/api-docs/index.html
```
and follow the instructions in the API documentation. 

### Front-end app

This app should run together with [vacations-booking-front-end](https://github.com/danmainah/vacations-booking-front-end) application. Open the [vacations-booking-front-end](https://github.com/danmainah/vacations-booking-front-end) repo and install it localy to complete the full-stack application.

## 👤👤 Authors

👤 **Aleksandar Ivezic**

- GitHub: [@Aleksandar Ivezic](https://github.com/ShinobiWarior)
- Twitter: [@AIvezic](https://twitter.com/AIvezic)
- LinkedIn: [Aleksandar Ivezic](https://www.linkedin.com/in/aleksandar-ivezic/)

👤 **Vo Thi Quynh Yen**

  - GitHub: [@themonster2015](https://github.com/themonster2015)
  - LinkedIn: [LinkedIn](https://www.linkedin.com/in/jen-vo-89bbb74b/)


👤 **Hubert MUGABO**

  -  Github: [@mugberto](https://github.com/mugberto)
  -  Twitter: [@mugberto](https://twitter.com/mugberto)
  -  Linkedin: [mugberto](https://www.linkedin.com/in/hubert-mugabo-23144b6a/)

👤 **Igor Koloski**

- GitHub: [@igorkol91](https://github.com/igorkol91)
- Twitter: [@Destro49536502]
- LinkedIn: [LinkedIn](https://linkedin.com/in/linkedinhandle)

👤 **Daniel Maina**

- GitHub: [@danmainah](https://github.com/danmainah)

- Twitter: [@Danmainah](https://twitter.com/dan_mainah)

- LinkedIn: [@Daniel-Maina](www.linkedin.com/in/daniel-maina-315a38191)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/mugberto/vacations-booking-back-end/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- This project was inspired by [Microverse](https://www.microverse.org/?grsf=w9rx3c)

## 📝 License

This project is [MIT](https://github.com/ShinobiWarior/hello-rails-back-end/blob/setup/LICENSE) licensed.
