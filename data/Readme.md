# Data for Pérez-Matus, A., Micheli, F., Konar, B., Shears, N., Low, N., Okamoto, D., Wernberg, T., Krumhansl, K., Ling, S., Kinsgford, M., Navarrete-Fernandez, T.,  Ruz, C., and Byrnes, J. 2024. Kelp forests as nursery and foundational habitat for reef fish. Ecology.

Below, find the metadata for columns in each raw data file.

## Raw Data
Note, raw files are in two formats due to working back and forth across different filesystems. Here we have included both purely CSV files as well as files using a mix of commas and semi-colons as raw files, as due to differences in author computers, both were created. The files do not differ at all in content. We include them both for completeness of record.

Data was extracted from papers using [Web Plot Digitizer](https://automeris.io/).  

### Fishkelp_downloaded_from_googledocs_20230208.csv
### FishKelpMetanalaysis.csv (semi-colon delimiter)

- ...1 - A blank column denoting row number.  

- Authors (Year) The authorship of the paper and year in parenthesis of the paper.  For example “Cole et al. (1990)”.  

- ID - Number matching the study ID in the "Fish-Kelp Signup" sheet.  

- Site - Name of site as specified in the paper.  

- Lat - Latitude of the site in arbitrary format.  

- Long - Longitude of the site in arbitrary format.  

- Management_(OA_MPA_MEARB_Other) - Management regime if present. Either 
	OA - Open Access
	MPA - Marine Protected Area
	MEARB - Management and exploitation area
	Other - Any other management type

- Temporal_Scale - The length of time of the study. Descriptive.

- Mean kelp - Mean Abundance of fish variable in a kelp patch mined from a table or Web Plot Digitizer.  

- Mean no Kelp - Mean Abundance of fish variable in a patch without kelp mined from a table or Web Plot Digitizer.  

- Mean + one error bar Kelp - Mean Abundance plus one unit of error of fish variable in a kelp patch mined from a table or Web Plot Digitizer.  

- Mean + one error bar no Kelp - Mean Abundance plus one unit of error of fish variable in a patch without kelp mined from a table or Web Plot Digitizer

- Error Kelp: One unit of error for the mean kelp observation.  I.e., the Mean + one error bar variable - mean.
  
- Error no-Kelp: One unit of error for the mean no kelp observation.  I.e., the Mean + one error bar variable - mean.
  
- Error Type: The type of error measured. E.g., SD, SE, 2SE, 95% CI.

- Variable: Description of what was measured

- N (Kelp): The sample size of the kelp observations.

- N (no-kelp): The sample size of the no kelp observations.

- Unit Dimensions: The dimensions of one sample unit.

- Area (m2): The area in square meters of one sample unit. Note, people filled this in in a lot of different ways, so this column should be used to calculate the new sample unit area value.  We’ll be deleting it eventually.

- Notes on Type of study: Short description of the study.
 
- Comments: Additional comments describing data harvesting and issues with the data.

- Kelp Taxon: What kelp were manipulated or observed?

- Clearing Size (m^2): What was the size of clearings in the study in square meters. 

- Time Until Resampling (days): How many days from the initiation of an experiment or disturbance event until when the observation was recorded. 

- Mean Depth (m): Depth where the observation was taken in meters. 

- Inferred Mechanism of Clearing (experiment, storm, heat wave, barren, kelp addition): What mechanism can be inferred for creating a clearing. Use the provided words as your entry.

- Type of Study (Experimental, Observational): Was the study from an experimental manipulation or an observational study. Use the provided words as your entry.

- Observational Study Type (Spatial, Temporal): If this was an observational study, were comparisons of plots made across space or over time? Use the provided words as your entry.

- Single Species? (yes/no): Did this data point record information about a single species? yes/no only.

- Total Abundance? (yes/no): Did this data point record information about a total community abundance? yes/no only.

- Species Richness? (yes/no): Did this data point record values of species richness? yes/no only.

- Biomass? (yes/no): Did this data point record information about a biomass? yes/no only.

- Clearing Response (algae, barren, kelp): How did the kelp removal site respond.  Did it turn back into an algal bed, a barren of some type, or did kelp return. Use the provided words as your entry. Invertebrate barrens are still barrens.

- Survey Type (quadrat, transect, video, photo, Net/Trap): What was used for the survey? Use the provided words as your entry.
  
- Short Variable Description: 3-4 word description of the response variable measured.
  
- Latitude in Decimal Degrees: Latitude of the site in decimal degrees. Only numbers!
  
- Longitude in Decimal Degrees: Longitude of the site in decimal degrees. Only numbers!
  
- Juvenile, Adult, Both: Were the individuals sampled juvenile, adults, or a mixture of both juveniles and adults?
  
- sample unit area (m^2): The size of one measurement unit in square meters (e.g., one quadrat, or one transect, or one two). 
  
- Total Area Sampled per Treatment (m^2: n * replicate area): The total area sampled if you summed up the area of all of the replicate samples.  Typically, this is n * the sample area.
  
- Mean kelp t0: Mean Abundance of fish variable in a kelp patch  from before the removal event. This can be mined from a table or Web Plot Digitizer. NA if no measurement.
  
- Mean no Kelp t0: Mean Abundance of fish variable in a no kelp patch  from before the removal event. This can be mined from a table or Web Plot Digitizer. NA if no measurement.
  
- Mean + one error bar Kelp t0: Mean Abundance plus one unit of error of fish variable in a kelp patch  from before the removal event. This can be mined from a table or Web Plot Digitizer. NA if no measurement.
  
- Mean + one error bar no Kelp t0: Mean Abundance plus one unit of error of fish variable in a kelp patch  from before the removal event. This can be mined from a table or Web Plot Digitizer. NA if no measurement.
  
- Error Kelp t0: One unit of error for the mean kelp observation before the removal event.  I.e., the Mean + one error bar variable - mean. NA if no measurement.
  
- Error no-Kelp t0: One unit of error for the mean no kelp observation before the removal event.  I.e., the Mean + one error bar variable - mean. NA if no measurement.
  
- Error Type t0: The type of error measured before the removal. E.g., SD, SE, 2SE, 95% CI.
  
- Date of t0 (dd/mm/yyyy): Date that the removal was started in the format specified.

- Fish Species - Latin Binomial of fish species name.
  
- Order - Order of Fish species.
  
- Family -  Family of fish species
  
- Trophic level - Trophic level as defined by http://fishbase.org
  
- Trophic group - Trophic group of fish as defined by http://fishbase.org
  
- Total Length (cm) - Average length (cm) of fish species as defined by http://fishbase.org
  
- Biomass (gr) - Average biomass (g) of fish species  as defined by http://fishbase.org
  
- Habitat Association (Benthic-Pelagic-Demersal) - Is this a species that tends to be benthic, pelagic, or demersal. Controlled vocabulary.


### Fish-Kelp Kelp Taxon Information - Sheet1.csv
### kelptaxon.csv (semi-colon delimiter)


## Derived Data
biomass_clean.csv
masterFish_clean.csv
single_sp_abund_clean.csv
sp_rich_clean.csv
total_abund_clean.csv