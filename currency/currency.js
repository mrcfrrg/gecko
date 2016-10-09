var API_KEY = '1bfdb1e922b674444b44e18fe1ab5725';

var gb = require('geckoboard')(
  API_KEY
);

var fs = require('fs');

carmelo = JSON.parse(
					fs.readFileSync('/node/gecko/node_modules/geckoboard/currency/list.json')
					);

for (var x in carmelo) {
						delete carmelo[x]["15m"];
						};
var list = []

for (var x in carmelo) {
	list.push(carmelo[x]);
};
						
gb.datasets.findOrCreate(
  {
    id: 'currency',
    fields: {
      last: {
        type: 'number',
        name: 'Last value'
      },
      buy: {
        type: 'number',
        name: 'Buy value'
      },
      sell: {
        type: 'number',
        name: 'Sell value'
      },
      symbol: {
        type: 'string',
        name: 'Currency symbol'
      }
    }
  },  
  function (err, dataset) {
    if (err) {
      console.error(err);
      return;
    }

    dataset.put(list,
      function (err) {
        if (err) {
          console.error(err);
          return;
        }
        console.log('Dataset created and data added');
      }
    );
  }
);