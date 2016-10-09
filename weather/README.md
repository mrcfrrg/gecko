The code in this project takes data from openweathermap.org, updated every hour, to answer to the question:
is the weather better in London or Pisa?

**Step 1**
Performed when initializing the dataset, using create_data_model.sh.
It will call the create_data_model.js inside itself, to create the datamodel.

**Step 2**
Repetitive tasks. Schedule dataset_london.sh and dataset_pisa.sh (I scheduled them to run every hour, not at the same time) to:
- call openweathermap API to have the latest updates, calling the files generate_list_*.sh and modify the list (considering the list as a text, not as JSON: using a JSON parser would improve things in terms of legibility, but anyway there are a few steps needed to clean the data).
- push the data to Gecko, using a direct curl PUT call. Not the cleanest way (it's much better to do everything through JavaScript, as in the other related project currecny) but it is an interesting experiment.


> **Note** 
> 
> Two items are identified (unique_by) by city and time of the forecast, so at every new push data is updated, and we always have the best forecast in the dashboard.
> Moreover the dashboard serves as storage for old data, which we should pay for if we asked it to openweathermap ;)

[Link to the dashboard](https://mrcfrrg.geckoboard.com/dashboards/9251A31B065C031A)
