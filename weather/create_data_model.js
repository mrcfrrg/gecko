var API_KEY = '1bfdb1e922b674444b44e18fe1ab5725';

var gb = require('geckoboard')(
  API_KEY
);

gb.datasets.findOrCreate(
  {
    id: 'weather',
    fields: {
      city: {
        type: 'string',
        name: 'City'
      },
      temp: {
        type: 'number',
        name: 'Temperature'
      },
      pressure: {
        type: 'number',
        name: 'Pressure'
      },
      wind_speed: {
        type: 'number',
        name: 'Wind Speed'
      },
      rain: {
        type: 'number',
        name: 'Rain'
      },
      weather: {
        type: 'string',
        name: 'Weather'
      },
      description: {
        type: 'string',
        name: 'Weather description'
      },
      time: {
        type: 'datetime',
        name: 'Forecast time'
      }
    },
  "unique_by": ["city","time"]
  },  
  function (err, dataset) {
    if (err) {
      console.error(err);
      return;
    }
  }
);