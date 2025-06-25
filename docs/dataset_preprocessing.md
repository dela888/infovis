# Dataset and Preprocessing

In our datastory a variety of sources have been used to paint a picture of nuclear energy, as nuclear energy is a topic with many different aspects. The data used in this story has been parsed and cleaned in a variety of different ways. In this section we will lay out how we obtained, parsed, and cleaned our data.

## Datasets used

- [Nuclear Energy Datasets](https://www.kaggle.com/datasets/alistairking/nuclear-energy-datasets): A collection of nuclear energy related datasets gathered from a variety of sources. Because all the data is in a clean `csv` format, not much data cleaning was needed for using these datasets.

- [Impacts of Energy Production](https://www.kaggle.com/datasets/whenamancodes/impacts-of-energy-production): This dataset contains information on the impact of energy production in a number of different fields for a number of energy sources. The source of the data is the *United Nations Economic Commission for Europe*. This data was downloaded as a `csv` file.

- [Global Data on Sustainable Energy (2000-2020)](https://www.kaggle.com/datasets/anshtanwar/global-data-on-sustainable-energy): This dataset contains various information on sustainable energy per country per year. This data was downloaded as a `csv` file.

- [Major Nuclear Plant Incidents (1957- 2011)](https://www.kaggle.com/datasets/mauryansshivam/major-nuclear-plant-incidents-1957-2011): This dataset contains data on nuclear incidents worldwide per year. This data was downloaded as a `csv` file.

- [Energy Information Administration Spent Nuclear Fuel](https://www.eia.gov/nuclear/spent_fuel/ussnftab3.php): This dataset from the **EIA** contains information on spent nuclear fuel, more commonly known as nuclear waste. The data is displayed in a `html` table on the web page.

- [Levelised Cost of Electricity](https://www.iea.org/data-and-statistics/data-tools/levelised-cost-of-electricity-calculator): This dataset contains data projected energy costs per energy source per country from the *International Energy Agency*. The data is displayed in a `html`

## Data Parsing

Two of our datasets were only available as `html` on the web page. To parse the data we first copied the table `html` (using inspect), and used the *pandas* function `pd.read_html`, and `pd.to_csv` to convert the `html` tables to `csv` files. For some data the variable names were changed for better readibility.

## Data Cleaning



## Used Variables
- Continuous / Ratio Variables: `Electricity from nuclear (TWh)`, `Electricity from fossil fuels (TWh)`, `Electricity from renewables (TWh)`, `Nuclear_Electricity_Percentage`, `Capital (Capital costs)`, `OM (O&M costs)`, `Fuel_th (Fuel thermal costs)`, `Fuel_el (Fuel electricity costs)`, `Carbon (Carbon costs)`, `CHP_revenue (CHP heat revenues)`, `LCOE (Levelized Cost of Electricity)`, `Savings (%)`, `Deaths per TWh of electricity production`, `bwr_average_burnup`, `pwr_average_burnup`, `bwr_tons_uranium`, `pwr_tons_uranium`, `total_average_burnup`
- Continuous / Interval: `Latitude & Longitude` 
- Discrete / Ordinal Variables: `INES Level`
- Discrete / Nominal Variables: `Entity (Country Name)`, `Incident`, `Location`, `Category`, `hover_text`, `Category (Energy type: Nuclear, Wind, Solar, etc.)`, `Country`, `Technology (Wind, Solar, Gas, Coal)`, `Hover Text`, `Entity (Energy Source)`, 
- Discrete / Interval Variables: `Year` , `Date`,`year`, 
- Discrete / Ratio Variables: `Numbers of Direct Deaths`, `Numbers of InDirect Deaths`


## Aggregations

### Spent Fuel

In the *Energy Information Administration Spent Nuclear Fuel* dataset, the data was aggregated to calculate the total yearly burnup, as the dataset only contained the burnup per nuclear reactor method. The formula for the total yearly burnup is the following:

$$
B_{\text{total}} = \frac{
    B_{\text{BWR}} \cdot U_{\text{BWR}} + B_{\text{PWR}} \cdot U_{\text{PWR}}
}{
    U_{\text{BWR}} + U_{\text{PWR}}
}
$$

With $B$ being the burnup in $GWd / MTU$, and $U$ being the amount of uranium used per year in metric tons, and $BWR$ and $PWR$ standing for *'Boiling Water Reactor'* and *'Pressurised Water Reactor'*.

### Nuclear Energy Percentage

In the *Global Data on Sustainable Energy (2000-2020)*, we calculate the percentage of nuclear energy relative to the total energy pool per country with the following formula:

$\text{Nuclear_Electricity_Percentage} = \left( \frac{E_{\text{nuclear}}}{E_{\text{fossil}} + E_{\text{nuclear}} + E_{\text{renewables}}} \right) \times 100$

waar:

- $ E_{\text{nuclear}} $ = elektriciteit uit kernenergie (TWh)
- $ E_{\text{fossil}} $ = elektriciteit uit fossiele brandstoffen (TWh)
- $ E_{\text{renewables}} $ = elektriciteit uit hernieuwbare bronnen (TWh)