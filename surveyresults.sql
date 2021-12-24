CREATE TABLE survey_results(
Respondent int,
	MainBranch varchar,
	Hobbyist text,
	Age varchar,
Age1stCode varchar,
	CompFreq varchar,
	CompTotal varchar,
	ConvertedComp varchar,
	Country varchar,
	CurrencyDesc varchar,
	CurrencySymbol varchar,
	DatabaseDesireNextYear varchar,
	DatabaseWorkedWith varchar,
	DevType varchar,
	EdLevel varchar,
	Employment varchar,
	Ethnicity varchar,
	Gender varchar,
	JobFactors varchar,
	JobSat varchar,
	Jobseek varchar,
	LanguageDesireNextYear varchar,
	LanguageWorkedWith varchar,
	MiscTechDesireNextYear varchar,
	MiscTechWorkedWith varchar,
	NEWCollabToolsDesireNextYear varchar,
	NEWCollabToolsWorkedWith varchar,
	NEWDevOps varchar,
	NEWDevOpsImpt varchar,
	NEWEdImpt varchar,
	NEWJobHunt varchar,
	NEWJobHuntResearch varchar,
	NEWLearn varchar,
	NEWOffTopic varchar,
	NEWOnboardGood varchar,
	NEWOtherComms varchar,
	NEWOvertime varchar,
	NEWPurchaseResearch varchar,
	NEWPurpleLink varchar,
	NEWSOSites varchar,
	NEWStuck varchar,
	OpSys varchar,
	OrgSize varchar,
	PlatformDesireNextYear varchar,
	PlatformWorkedWith varchar,
	PurchaseWhat varchar,
	Sexuality varchar,
	SOAccount varchar,
	SOComm varchar,
	SOPartFreq varchar,
	SOVisitFreq varchar, 
	SurveyEase varchar,
	SurveyLength varchar,
	Trans varchar,
	UndergradMajor varchar,
	WebframeDesireNextYear varchar,
	WebframeWorkedWith varchar,
	WelcomeChange varchar,
	WorkWeekHrs varchar,
	YearsCode varchar,
	YearsCodePro varchar);
	
	COPY survey_results
	FROM 'C:\Users\Public\SQL FILES\survey_results1.csv'
	DELIMITER ',' CSV
	HEADER;
	
	SELECT *
	FROM survey_results;
	
	UPDATE survey_results
	SET age = REPLACE(age, 'ISNULL', '0')
	
	ALTER TABLE survey_results
	ALTER COLUMN age TYPE float USING (age::float)
	
	/*How many developer participated in the survey*/
	
	SELECT COUNT (respondent)
	FROM survey_results;
	
	/*find the top 10 countries participating in the survey*/
	
	SELECT country, COUNT (country)AS numberofparticipants
	FROM survey_results
	GROUP BY country
	ORDER BY numberofparticipants DESC LIMIT 10;
	
	/*how many are from Nigeria*/
	
	SELECT country, COUNT (country)AS numberofparticipant
	FROM survey_results
	WHERE country = 'Nigeria'
	GROUP BY country;
	
	/*what is the average age of the Nigerian dev*/
	
	SELECT country, AVG(age)AS avg_age
	FROM survey_results
	WHERE country = 'Nigeria'
	GROUP BY country;
	
	/*what are the kinds of employment they are in?*/
	
	SELECT DISTINCT (employment) AS employment,
	COUNT (employment)AS numberofnigerians
	FROM survey_results
	WHERE country = 'Nigeria'
	GROUP BY employment
	ORDER BY numberofnigerians DESC;
	
	/*what's the gender distribution*/
	
	SELECT DISTINCT(gender) AS gender,
	COUNT (gender)AS genderdistribution
	FROM survey_results
	WHERE country = 'Nigeria'
	GROUP BY gender, country
	ORDER BY genderdistribution DESC;
	
	/*what major did they study in school?*/
	
	SELECT DISTINCT undergradmajor AS majors, 
	COUNT (undergradmajor)AS numberofnigerians
	FROM survey_results
	WHERE country = 'Nigeria'
	GROUP BY undergradmajor
	ORDER BY numberofnigerians DESC;
	
	/*what language have they worked with*/
	
	SELECT DISTINCT languageworkedwith,
	COUNT (languageworkedwith)AS numberofnigerians
	FROM survey_results
	WHERE country = 'Nigeria'
	GROUP BY languageworkedwith
	ORDER BY numberofnigerians DESC;
	
	/*what is the average number of language they have worked with?*/
	
	SELECT
	AVG COUNT(languageworkedwith)/COUNT(country)AS avgnumberoflang
	FROM survey_results
	WHERE country = 'Nigeria'
	GROUP BY country, languageworkedwith;
	
	/*what's the average number of years of experience of 
	the Nigerian developer*/
	
	SELECT country, yearscode AS yearsofexperience
	FROM survey_results
	WHERE country = 'Nigeria'
	GROUP BY country, yearscode;
	
	/*Kicker*/
	/*1*/
	SELECT gender, age, employment
	FROM survey_results
	WHERE age < '25' AND gender = 'Woman' AND employment =
	GROUP BY gender, age, employment;
	
	/*2*/
	SELECT DISTINCT(languageworkedwith), 
	COUNT (country)AS popular_lang
	FROM survey_results
	WHERE country = 'Nigeria'
	GROUP BY languageworkedwith
	ORDER BY COUNT (country)DESC LIMIT 10; 
	
	
	
	
	
	