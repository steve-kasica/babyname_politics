# Baby Name Politics

This is the source code in R for "[Is Your Name Democratic or Republican?](https://time.com/4606813/democrat-republican-name/)" We developed these figures based on the [Social Security Administration's state-by-state data files](https://www.ssa.gov/OACT/babynames/limits.html), which report any name that was given to at least five children in that state in a given year. Of the 10,008 names that show up in at least one state, 2,805 appear in 10 and were thus sufficiently regional for our analysis.

The final product is a CSV file with all 2,805 names, merged with the 2016 political outcome in each name's top-ten states, as well as an individual CSV file for each name that has information on each of the 10 states.

## Getting the data
Download the following two zip files into the `data` directory and unzip them:

	cd data
	wget https://www.ssa.gov/OACT/babynames/names.zip
	wget https://www.ssa.gov/OACT/babynames/state/namesbystate.zip
	unzip names.zip -d national
	unzip namesbystate.zip -d states
	rm *.zip

## Running the script
There's only one main script at work here, `read_names.R`. (The other R script, at [lib/utils.R](lib/utils.R), is included in the main script.) If you just want to  generate the files, and you have R installed, you only need to run the script after downloading the data:

	RScript read_names.R

If you're interested in seeing the sausage get made, you can load this project in RStudio by opening `babyname_politics.Rproj`. The code is well commented to describe the purpose of each step.

## Methodology
After experimenting with several calculations, TIME chose to focus on where names were most regionally popular compared to other names in the same state, as opposed to merely the most commonly used, so as not to heavily skew the results in favor of populous states. Names were only considered if they showed up in at least ten states because, since a state’s data is limited to names used at least five times in 2015, highly uncommon names cannot be reliably analyzed by region. In cases where a name had the same rank in two states, the tie went to the state where the name had the highest volume.

(Reprinted from Time.com)

