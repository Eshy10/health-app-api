# Health Tracker Api
 >Health Tracker api RESTful API that allows authenticated users to measure their weight, cholestrol and also track the measurements.

 ## Signup User
```
  axios.post("https://nameless-temple-95690.herokuapp.com/signup", {
      name: 'Eshy Shola',
      email: shola@gmail.com,
      password: 12345,
      password_confirmation: 12345,
    })
  .then(response => console.log(response))
  .catch(error => console.log(error))
```
 ## Login User
```
  axios.post("https://nameless-temple-95690.herokuapp.com/auth/login",
    {
      email: eshy@gmail.com,
      password: 12345,
    }
  )
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

 ## Create Measurements
```
  const token = localStorage.getItem('token')
    const config = {
      headers: { Authorization: `Bearer ${token}` }
    };
        
    const measurements = {
      value: measure.value,
      date: measure.date,
      measure_category_id: measure.measure_category_id
    };

  axios.post("https://nameless-temple-95690.herokuapp.com/api/v1/measurements", measurements, config)
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

## Get All Measurements
```
  const token = localStorage.getItem('token')
  axios.get("https://nameless-temple-95690.herokuapp.com/api/v1/measurements",
    {
    headers: {
      Authorization: `Bearer ${token}`,
     },
  )
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

## To Create More Measure Categories
```
Run rails console in your terminal and do the following command:
MeasureCategory.create(name: "Blood Pressure")
```

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby: 2.6.3
- Rails: 5.2.4
- Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```



### Usage

Start server with:

```
    rails server
```


### Run tests

```
    rspec --format documentation
```

##  Unit Test

- Rspec


## Author

👤 Adewale Adeshola

- Github: [@Eshy10](https://github.com/Eshy10)
- Twitter: [@AdesholaAdewal6](https://twitter.com/AdesholaAdewal6?s=09)
- Linkedin: [@adewale-adeshola](https://www.linkedin.com/in/adewale-adeshola)

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to <a href="https://microverse.org/">Microverse</a>