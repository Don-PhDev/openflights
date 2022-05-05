def data_destroyer
  User.destroy_all
  Airline.destroy_all
end

def data_creator
  User.create(
    email: "test@gmail.com",
    password: "password"
  )

  Airline.create([
    { 
      name: "United Airlines",
      image_url: "https://open-flights.s3.amazonaws.com/United-Airlines.png"
    }, 
    { 
      name: "AirAsia",
      image_url: "https://open-flights.s3.amazonaws.com/AirAsia.png"
    },
    { 
      name: "Delta Airways",
      image_url: "https://open-flights.s3.amazonaws.com/Delta.png" 
    }, 
    { 
      name: "AeroFlot Airlines",
      image_url: "https://open-flights.s3.amazonaws.com/Aeroflot.png"
    }, 
    { 
      name: "Spark Airways",
      image_url: "https://open-flights.s3.amazonaws.com/Qantas-Airways.png"
    }, 
    { 
      name: "American Airlines",
      image_url: "https://open-flights.s3.amazonaws.com/American-Airlines.png" 
    },
    {
      name: "Philippine Airlines",
      image_url: "https://open-flights.s3.amazonaws.com/Philippine-Airlines.png" 
    },
    {
      name: "Cebu Pacific Air",
      image_url: "https://open-flights.s3.amazonaws.com/Cebu-Pacific.png" 
    }
  ])
end

data_destroyer
data_creator
