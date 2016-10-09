The flow can be followed through script.sh, which will be run server side every 15 minutes.
There are two key steps:

**Step 1**
Get the list of bitcoin rates from [blockchain](https://blockchain.info/ticker) and put it in a temp file named list.json.
> Note: this should be replaced by a curl call in javascript, handled through ajax.

**Step 2**
Calling the currency.js file, the following happens:
- the content of list.json is parsed as a JSON object
- a useless field is removed
- the dataset is created
- data is pushed to the dataset

[Link to the dashboard](https://mrcfrrg.geckoboard.com/dashboards/95203593D7DE5CA7)
