BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "WORKS_ON" (
	"sID"	INTEGER NOT NULL,
	"title"	VARCHAR NOT NULL,
	FOREIGN KEY("sID") REFERENCES "STUDENT"("sID"),
	FOREIGN KEY("title") REFERENCES "RESEARCH_WORK"("title")
);
CREATE TABLE IF NOT EXISTS "SUPERVISED_BY" (
	"fID"	INTEGER NOT NULL,
	"title"	VARCHAR NOT NULL,
	FOREIGN KEY("fID") REFERENCES "PROFESSOR"("fID"),
	FOREIGN KEY("title") REFERENCES "RESEARCH_WORK"("title")
);
CREATE TABLE IF NOT EXISTS "STUDENT" (
	"sID"	INTEGER NOT NULL,
	"sex"	CHAR(1),
	"sFName"	VARCHAR(15),
	"sMName"	VARCHAR(15),
	"sLName"	VARCHAR(15),
	"sEmail"	VARCHAR,
	"sAddr"	VARCHAR,
	"majorID"	INTEGER NOT NULL,
	PRIMARY KEY("sID"),
	FOREIGN KEY("majorID") REFERENCES "DEPARTMENT"("dID")
);
CREATE TABLE IF NOT EXISTS "RESEARCH_WORK" (
	"abstract"	VARCHAR,
	"title"	VARCHAR NOT NULL,
	"dType"	CHAR,
	"dLoco"	VARCHAR,
	"SyName"	CHAR NOT NULL,
	PRIMARY KEY("title"),
	FOREIGN KEY("SyName") REFERENCES "SYMPOSIUM"("SyName")
);
CREATE TABLE IF NOT EXISTS "MINOR_IN" (
	"sID"	INTEGER NOT NULL,
	"minorDep"	INTEGER NOT NULL,
	FOREIGN KEY("minorDep") REFERENCES "DEPARTMENT"("dID"),
	FOREIGN KEY("sID") REFERENCES "STUDENT"("sID")
);
CREATE TABLE IF NOT EXISTS "MEETING" (
	"minutes"	INTEGER,
	"task"	INTEGER,
	"MDate"	DATE NOT NULL,
	"SyName"	CHAR NOT NULL,
	PRIMARY KEY("MDate","SyName"),
	FOREIGN KEY("SyName") REFERENCES "SYMPOSIUM"("SyName")
);
CREATE TABLE IF NOT EXISTS "PROFESSOR" (
	"fID"	INTEGER NOT NULL,
	"pFName"	VARCHAR(15),
	"pMName"	VARCHAR(15),
	"pLName"	VARCHAR(15),
	"pOffice"	VARCHAR,
	"pPhone"	INTEGER(10),
	"dName"	VARCHAR NOT NULL,
	PRIMARY KEY("fID"),
	FOREIGN KEY("dName") REFERENCES "DEPARTMENT"("dName")
);
CREATE TABLE IF NOT EXISTS "DEPARTMENT" (
	"dID"	INTEGER NOT NULL,
	"dName"	VARCHAR NOT NULL,
	"depLoco"	VARCHAR,
	"cStartDate"	DATE,
	"chairID"	INTEGER NOT NULL,
	PRIMARY KEY("dID","dName"),
	FOREIGN KEY("chairID") REFERENCES "PROFESSOR"("fID")
);
CREATE TABLE IF NOT EXISTS "SYMPOSIUM" (
	"SyName"	CHAR NOT NULL,
	"SyDate"	DATE,
	"SyLocation"	VARCHAR,
	"keySpeech"	VARCHAR(15),
	"winTitle"	VARCHAR,
	PRIMARY KEY("SyName"),
	FOREIGN KEY("winTitle") REFERENCES "RESEARCH_WORK"("title")
);
INSERT INTO "WORKS_ON" VALUES (279900,'Finite Numbers');
INSERT INTO "WORKS_ON" VALUES (279901,'Euclidian Geometry');
INSERT INTO "WORKS_ON" VALUES (279878,'Society Issues');
INSERT INTO "WORKS_ON" VALUES (279879,'Society Issues');
INSERT INTO "WORKS_ON" VALUES (279892,'Nursing Pediatric Floor');
INSERT INTO "WORKS_ON" VALUES (279893,'Nursing Emergency Room');
INSERT INTO "WORKS_ON" VALUES (279875,'Data Collecting');
INSERT INTO "WORKS_ON" VALUES (279902,'Dynamic Programming');
INSERT INTO "WORKS_ON" VALUES (279886,'Poem Reseach');
INSERT INTO "WORKS_ON" VALUES (279887,'African American Literature');
INSERT INTO "WORKS_ON" VALUES (279880,'Pricing Decisions for a Start-Up Company in the Car Rental Industry');
INSERT INTO "WORKS_ON" VALUES (279881,'Marketing Schema');
INSERT INTO "WORKS_ON" VALUES (279890,'ACL Injuries');
INSERT INTO "WORKS_ON" VALUES (279891,'Achilles Injuries');
INSERT INTO "WORKS_ON" VALUES (279884,'Music Therapy');
INSERT INTO "WORKS_ON" VALUES (279885,'Music Therapy');
INSERT INTO "WORKS_ON" VALUES (279888,'ACL Injuries');
INSERT INTO "WORKS_ON" VALUES (279889,'Achilles Injuries');
INSERT INTO "WORKS_ON" VALUES (279876,'Religous Backgrounds');
INSERT INTO "WORKS_ON" VALUES (279877,'Religous Backgrounds');
INSERT INTO "WORKS_ON" VALUES (279880,'Economic Issues');
INSERT INTO "WORKS_ON" VALUES (279873,'Types of Communication');
INSERT INTO "WORKS_ON" VALUES (279874,'Types of Communication');
INSERT INTO "WORKS_ON" VALUES (279894,'Living in Dystopia: Comparing American Water Crises');
INSERT INTO "WORKS_ON" VALUES (279895,'The Impacts of U.S. Factory Farming');
INSERT INTO "WORKS_ON" VALUES (279882,'Authentic Imagery Between Cultures: Portraits from the Classroom');
INSERT INTO "WORKS_ON" VALUES (279883,'Authentic Imagery Between Cultures: Portraits from the Classroom');
INSERT INTO "WORKS_ON" VALUES (279896,'Examining the Effects of IPA-3 on Protein Expression, Cell Proliferation, and Cell Migration in MDA-MB-231 and T47D Breast Cancer Cell Lines');
INSERT INTO "WORKS_ON" VALUES (279897,'Absolute Lymphocyte Count and Bone Marrow Transplant');
INSERT INTO "WORKS_ON" VALUES (279898,'Modeling the Spread of White-Nose Syndrome in Hibernating North American Bat Populations');
INSERT INTO "WORKS_ON" VALUES (279899,'Genetic Modification');
INSERT INTO "WORKS_ON" VALUES (279898,'The Genetic Modification Analysis of Popcorn Around the World');
INSERT INTO "SUPERVISED_BY" VALUES (19241,'Finite Numbers');
INSERT INTO "SUPERVISED_BY" VALUES (19258,'Euclidian Geometry');
INSERT INTO "SUPERVISED_BY" VALUES (19254,'Economic Issues');
INSERT INTO "SUPERVISED_BY" VALUES (19260,'Society Issues');
INSERT INTO "SUPERVISED_BY" VALUES (19245,'Nursing Pediatric Floor');
INSERT INTO "SUPERVISED_BY" VALUES (19269,'Nursing Emergency Room');
INSERT INTO "SUPERVISED_BY" VALUES (19240,'Data Collecting');
INSERT INTO "SUPERVISED_BY" VALUES (19267,'Dynamic Programming');
INSERT INTO "SUPERVISED_BY" VALUES (19248,'Poem Research');
INSERT INTO "SUPERVISED_BY" VALUES (19257,'African American Literature');
INSERT INTO "SUPERVISED_BY" VALUES (19250,'Pricing Decisions for a Start-Up Company in the Car Rental Industry');
INSERT INTO "SUPERVISED_BY" VALUES (19256,'Marketing Schema');
INSERT INTO "SUPERVISED_BY" VALUES (19247,'ACL Injuries');
INSERT INTO "SUPERVISED_BY" VALUES (19244,'Achilles Injuries');
INSERT INTO "SUPERVISED_BY" VALUES (19249,'Music Therapy');
INSERT INTO "SUPERVISED_BY" VALUES (19265,'Music Therapy');
INSERT INTO "SUPERVISED_BY" VALUES (19255,'ACL Injuries');
INSERT INTO "SUPERVISED_BY" VALUES (19261,'Achilles Injuries');
INSERT INTO "SUPERVISED_BY" VALUES (19253,'Religous Backgrounds');
INSERT INTO "SUPERVISED_BY" VALUES (19259,'Religous Backgrounds');
INSERT INTO "SUPERVISED_BY" VALUES (19252,'Types of Communication');
INSERT INTO "SUPERVISED_BY" VALUES (19263,'Types of Communication');
INSERT INTO "SUPERVISED_BY" VALUES (19246,'Living in Dystopia: Comparing American Water Crises');
INSERT INTO "SUPERVISED_BY" VALUES (19266,'The Impacts of U.S. Factory Farming');
INSERT INTO "SUPERVISED_BY" VALUES (19251,'Authentic Imagery Between Cultures: Portraits from the Classroom');
INSERT INTO "SUPERVISED_BY" VALUES (19268,'Authentic Imagery Between Cultures: Portraits from the Classroom');
INSERT INTO "SUPERVISED_BY" VALUES (19242,'Examining the Effects of IPA-3 on Protein Expression, Cell Proliferation, and Cell Migration in MDA-MB-231 and T47D Breast Cancer Cell Lines');
INSERT INTO "SUPERVISED_BY" VALUES (19262,'Absolute Lymphocyte Count and Bone Marrow Transplant');
INSERT INTO "SUPERVISED_BY" VALUES (19243,'The Genetic Modification Analysis of Popcorn Around the World');
INSERT INTO "SUPERVISED_BY" VALUES (19264,'Modeling the Spread of White-Nose Syndrome in Hibernating North American Bat Populations');
INSERT INTO "SUPERVISED_BY" VALUES (19242,'Genetic Modification');
INSERT INTO "STUDENT" VALUES (279873,'F','Nicole','Grace','Williams','N/A','1234 Main Street',1972);
INSERT INTO "STUDENT" VALUES (279874,'M','Michael','Charlie','Powell','mpowell@capital.edu','1234 Main Street',1972);
INSERT INTO "STUDENT" VALUES (279875,'F','Tori','Nicole','Grasso','tgrasso@capital.edu','1053 Coopers Run',1234);
INSERT INTO "STUDENT" VALUES (279876,'M','Jacob','Joe','Rogers','jrogers@capital.edu','1234 Main Street',5232);
INSERT INTO "STUDENT" VALUES (279877,'F','Eryn','Rae','Johnson','ejohnson@capital.edu','1234 Main Street',5232);
INSERT INTO "STUDENT" VALUES (279878,'M','Clayton','Blake','King','cking@capital.edu','1234 Main Street',3923);
INSERT INTO "STUDENT" VALUES (279879,'F','Mikalya','Zoe','Jones','N/A','1234 Main Street',3923);
INSERT INTO "STUDENT" VALUES (279880,'M','Cole','Booker','Bell','cbell@capital.edu','1234 Main Street',1820);
INSERT INTO "STUDENT" VALUES (279881,'F','Carlie','Nova','Brown','cbrown@capital.edu','1234 Main Street',1820);
INSERT INTO "STUDENT" VALUES (279882,'M','Bryce','Campbell','Hill','bhill@capital.edu','1234 Main Street',9712);
INSERT INTO "STUDENT" VALUES (279883,'F','Emma','Lane','Davis','edavis@capital.edu','1234 Main Street',9712);
INSERT INTO "STUDENT" VALUES (279884,'M','Hayden','Chase','Perry','N/A','1234 Main Street',5194);
INSERT INTO "STUDENT" VALUES (279885,'F','Taylor','Ruby','Miller','tmiller@capital.edu','1234 Main Street',5194);
INSERT INTO "STUDENT" VALUES (279886,'M','John','Dominic','Barley','jbailey@capital.edu','1234 Main Street',8364);
INSERT INTO "STUDENT" VALUES (279887,'F','Gabby','June','Wilson','gwilson@capital.edu','1234 Main Street',8364);
INSERT INTO "STUDENT" VALUES (279888,'M','Jawan','Eli','Green','jgreen@capital.edu','1234 Main Street',2344);
INSERT INTO "STUDENT" VALUES (279889,'F','Elle','Hunter','Moore','emoore@capital.edu','1234 Main Street',2344);
INSERT INTO "STUDENT" VALUES (279890,'M','Seth','Grant','White','swhite@capital.edu','1234 Main Street',1542);
INSERT INTO "STUDENT" VALUES (279891,'F','Cassidy','Kennedy','Scott','cscott@capital.edu','1234 Main Street',1542);
INSERT INTO "STUDENT" VALUES (279892,'M','Drake','Isaiah','Woods','dwoods@capital.edu','1234 Main Street',1048);
INSERT INTO "STUDENT" VALUES (279893,'F','Debra','Ivy','Cook','dcook@capital.edu','1234 Main Street',1048);
INSERT INTO "STUDENT" VALUES (279894,'M','Patrick','Julian','Ward','N/A','1234 Main Street',7722);
INSERT INTO "STUDENT" VALUES (279895,'F','Nancy','Paige','Ross','nross@capital.edu','1234 Main Street',7722);
INSERT INTO "STUDENT" VALUES (279896,'M','Lucas','Lee','Hughes','lhughes@capital.edu','1234 Main Street',9876);
INSERT INTO "STUDENT" VALUES (279897,'F','Irene','Moon','Barnes','ibarnes@capital.edu','1234 Main Street',9876);
INSERT INTO "STUDENT" VALUES (279898,'M','Thomas','Martin','Bryant','tbryant@capital.edu','1234 Main Street',8756);
INSERT INTO "STUDENT" VALUES (279899,'F','Patty','Haven','Bennett','N/A','1234 Main Street',8756);
INSERT INTO "STUDENT" VALUES (279900,'M','Jawan','Kane','Robinson','jrobinson@capital.edu','1234 Main Street',4321);
INSERT INTO "STUDENT" VALUES (279901,'F','Wendy','Violet','Reed','wreed@capital.edu','1234 Main Street',4321);
INSERT INTO "STUDENT" VALUES (279902,'M','Rey',NULL,'Garcia','rgarcia@capital.edu','1234 Main Street',1234);
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Data Collecting','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','ACL Injuries','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Achilles Injuries','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Euclidian Geometry','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Finite Numbers','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Economic Issues','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Society Issues','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Dynamic Programming','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Music Therapy','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Marketing Schema','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Poem Research','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','African American Literature','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Religous Backgrounds','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Nursing Pediatric Floor','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Nursing Emergency Room','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Lorem ipsum dolor sit amet, eu mei paulo congue. Mea eu eligendi quaerendum, ut aliquip urbanitas honestatis cum. Mea delicata periculis ex. Esse justo animal usu ea, pri ne ridens labore expetendis. Unum mandamus ea mei, ne usu perfecto facilisis qualisque, paulo efficiendi duo ea.','Types of Communication','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('On the morning of August 2, 2014, nearly half a million people in Toledo, Ohio, woke up to find “they could not wash their hands, take a shower, or fill up a bowl for their pets” (Kozacek, 2015). The city’s water crisis was immediately addressed. In April of 2014, a similar crisis surfaced in Flint, Michigan. After numerous complaints were made by residents, it was not until August of 2014 that city officials began to make efforts to detect pollutants in the contaminated water (Kennedy, 2016). It is important to critically evaluate the actions that were taken by these cities and understand why Flint is still facing these issues years later. This study performs a secondary data analysis using information from the U.S. Census and news articles. After analyzing these sources we found that actions taken by the two cities varied due to the types of water pollutants. However, we have uncovered underlying problems including structural racism and environmental classicism that add to the complexity of this issue. The findings of this study expose the poor decisions made by Flint officials and offer alternative solutions based on sociological and criminological research in the event of an environmental crisis.','Living in Dystopia: Comparing American Water Crises','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Ohio K-12 visual art content standards require that students understand how artistic decisions and interpretations are influenced by social, environmental, and political views. Teachers must engage in authentic praxis to meet these standards effectively. Art educators can use authentic imagery to enhance students’ perceptions of culture by considering perspectives of artists and fellow students around the world. This project examined the effectiveness of an overseas exchange as an instructional technique to combat stereotypical imagery and increase cultural awareness. In this case study, two elementary school classes in the U.S. and Ireland participated in a self-portrait exchange, which included three phases: (1) an entrance questionnaire asking students to describe themselves and a member of the other culture, (2) the creation of a self-portrait, and (3) an exit questionnaire that recorded their reactions to the self-portraits from the other culture. By engaging with authentic imagery from peers, students were able to find similarities/differences, and gain appreciation for members of the other culture. This exploration of student identity and culture is an important step toward engagement with social action, and it further supports the argument for K-12 art educators to use authentic imagery and cultural exchange projects in their praxis.','Authentic Imagery Between Cultures: Portraits from the Classroom','Poster','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('One type of prevalent cancer in the United States is breast cancer which accounts for 29% of all new cancers among women, and 15% of cancer deaths in women. The PAKs are a family of proteins found in a variety of breast cancers and were the main focus of this research. In completing literature research, I found that many scientists had examined various aspects of PAK 1, but few had looked at PAK 2. Additionally, while research had been completed examining the effect of IPA-3 on PAKs, little research had been done with breast cancer. Using Western blotting, Trypan blue exclusion assays, and migration assays, I examined the effect of IPA-3, a PAK inhibitor, on the proliferation and expression of PAK 1 and PAK 2 in MDA-MB-231 and T47D breast cancer cell lines. The results of this research showed that IPA-3 has a greater effect on the viability, migratory abilities, and protein expression in T47D cells than on MDA-MB-231 cells. This provides evidence that IPA-3 may have a greater effect on ER positive cells that express the receptor for estrogen than on triple negative breast cancer cells that do not express the estrogen, progesterone, or the HER2 receptors.','Examining the Effects of IPA-3 on Protein Expression, Cell Proliferation, and Cell Migration in MDA-MB-231 and T47D Breast Cancer Cell Lines','Poster/Speech','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Bone marrow transplantation (BMT) is a curative therapy for several diseases, however it brings complications such as graft versus host disease, increased infection risk, and transplant related mortality (TRM). Early identification of these complications represents the best hope of improving patient outcomes. There is evidence that absolute lymphocyte count (ALC) may represent a non-invasive method to predict both complications and outcomes for BMT, however it has yet to be studied in the pediatric population. This study retrospectively examines the correlation between ALC and outcomes of BMT, such as relapse rates of hematologic malignancy and TRM. ALC values were calculated at 30 and 100 days post BMT of 88 pediatric BMT patients. An analysis of ALC may be useful to predict the acquiring of infections or graft versus host disease; however, it did not show to be statistically significant as a predicator of transplant related death in the pediatric population in this trial. By knowing the impact of ALC recovery on outcomes, it can allow for enhanced treatment by identifying the patients at risk before proceeding with an invasive procedure and can determine how to best care for an immune-compromised patient. The study allowed a more consistent BMT protocol to be established across the ages.','Absolute Lymphocyte Count and Bone Marrow Transplant','Speech','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('In this study my goal was to find an answer to the question, “How does the system of livestock factory farming in the United States impact food supplies, human health, and the ecosystem?” and to shape the answer in the form of a persuasive speech. My research methodology was a two part process. In order to garner the facts and statistics relevant to my research question I consulted a multitude of online articles dealing with the three subjects, read (and analyzed the sources of) Meatonomics by David Simon, and worked with agriculture professor Mike Hogan of the Ohio State University, to determine whether cropland that grows feed crops for livestock is suitable to grow grains for human consumption. To shape the style of my speech I analyzed and combined two rhetorical methods, Cicero’s dispositio and Gustave Le Bon’s theory of “Affirmation, Repetition, Contagion” in his book The Crowd: A Study of the Popular Mind to gain access to a new style of public speaking that would have the careful organization of the former and the concise crowd appeal of the latter. The conclusions I drew from the research were that livestock factory farming in the United States is a very resource intensive system (through usage of crop land and feed grains specifically), that facilitates the spread of food-borne diseases (E.coli and Salmonella most frequently) and is a major cause of both water pollution nationally and deforestation internationally (predominantly in the Amazon rain forest where forests are converted to feed crop land for raising beef cattle). The nature of my research is not only topical (for example factory farming runoff was one of the main causes massive algal blooms in Lake Erie in the summer of 2014) but also unique in contextualizing how we as humans directly and daily impact others and our ecosystem. To conclude I will explain how the system of factory farming is tied to and heavily promoted by federal government policy and what citizens as consumers and voters can do to curb its negative impacts.','The Imacts of U.S. Factory Farming','Speech','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Advances have been made in agricultural biotechnology, and the prevalence of genetically modified food has increased substantially in the 21st century. A variety of crops are being modified to increase nutritional value and decrease damage from pests. Popcorn (Zea mays variant) is one of the top snack foods in the US, and one of the crops that has been targeted for genetic modification. The current experiment was designed to see whether or not common brands of popcorn in the US have been genetically modified (no previously published studies were found). Using modifications of standard procedures, published by Bio-Rad Inc., DNA was extracted from regular, organic, whole kernel, and pre-popped popcorn. The samples were crushed into a fine powder for DNA extraction before being amplified through PCR, run on 3% agarose gels (along with positive and negative GM controls). Results were visualized with ultraviolet light following ethidium bromide staining. Preliminary results (N = 60) show that nearly 75% of popcorn samples have been genetically modified. We compared genetic modification of popcorn companies within the United States to popcorn companies around the world. The results of this experiment allow consumers to know which brands and products of popcorn are genetically modified.','The Genetic Modification Analysis of Popcorn Around the World','Speech','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('North American bat populations are currently being threatened by an emergent infectious fungal disease known as white-nose syndrome (WNS) which causes mass mortality in hibernating colonies. Since it was first detected in New York in 2006, WNS has spread rapidly in the United States and Canada and killed over 5.5 million bats. Control of WNS is of major concern to both the scientific and caving communities, and the disease and mechanisms of transmission are still not well understood. We developed an individual-based model at the county level to gain insight into the spatial and temporal spread of the disease. We assume the probability of infection for each county in a given year is a function of the density of caves, the estimated cave temperature, and relative proximity to other infected counties. Model parameters were estimated by means of maximum likelihood. We compared model predictions with known infection data from 2006 until 2011. The model imitates the overall spatial and temporal patterns of the data and may be improved by decreasing the number of “false alarm” predictions in future extensions of the study. ','Modeling the Spread of White-Nose Syndrome in Hibernating North American Bat Populations','Speech','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('The car rental industry is worth more than $20 billion, accounting for 1.4% of the total GDP in the U.S., where car is the main mode of transportation. It is thus crucial to have a deeper look into the pricing decisions of the car-rental agencies (CRAs). This research aims to shed light on and to provide an analytical framework that can aid management of CRAs in making optimal pricing decisions while achieving the service expectations of the customers. Under the case of private information, and given the pricing scheme of the competitor, this research investigates and compares various multi-part pricing schemes, such as “fixed plus per-mileage,” to determine which one yields the maximum target profit for the sustainability of a start-up CRA. Regarding the value of transparency in service pricing to the customer, this research also studies the impact of the variability of probability distributions of mileage on the optimal prices and the resulting revenues. The determination of and the conditions under which a pricing scheme is superior to the others are attained by the theory of optimization and various operations management techniques.','Pricing Decisions for a Start-Up Company in the Car Rental Industry','Speech','Capital Center','2020 Annual Symposium');
INSERT INTO "RESEARCH_WORK" VALUES ('Eschatology, the study of the end of things, is often pointed to as the source of hope within the Christian faith. Such theology, which focuses on a new future without suffering, has sometimes been interpreted to ask humans to patiently endure their suffering and wait for it to pass, without providing anything substantial to help them cope. In the face of injustice this is often insufficient. Liberation Theology presents an alternative, more active, form of hope which exists in the midst of suffering and leads to change. I examine the movement of the Arpilleristas in Chile during the dictatorship of Pinochet to better understand how justice movements embrace a more active hope. By applying the beliefs of liberation theologians such as Dorothee Soelle, Jurgen Moltmann, and Vaclav Havel, I find that in a time when success seemed impossible and suffering dominated their lives, these women were able to cultivate hope through solidarity, a redefining of meaning in their lives, and action. For the sake of justice movements everywhere, such an understanding of hope is essential and must be adopted if we are to engage with this world rather than accept its injustices and suffering.','Genetic Modification','Speech','Capital Center','2020 Annual Symposium');
INSERT INTO "MINOR_IN" VALUES (279875,4321);
INSERT INTO "MINOR_IN" VALUES (279902,4321);
INSERT INTO "MINOR_IN" VALUES (279891,7722);
INSERT INTO "MINOR_IN" VALUES (279884,3923);
INSERT INTO "MINOR_IN" VALUES (279874,2344);
INSERT INTO "MINOR_IN" VALUES (279873,5232);
INSERT INTO "MINOR_IN" VALUES (279893,5294);
INSERT INTO "MINOR_IN" VALUES (279875,1820);
INSERT INTO "MEETING" VALUES (60,'Task Assign','01/04/2020','2020 Annual Symposium');
INSERT INTO "MEETING" VALUES (30,'Updates','02/04/2020','2020 Annual Symposium');
INSERT INTO "MEETING" VALUES (30,'Updates','03/04/2020','2020 Annual Symposium');
INSERT INTO "MEETING" VALUES (30,'Updates','04/04/2020','2020 Annual Symposium');
INSERT INTO "MEETING" VALUES (60,'Final Touches','04/10/2020','2020 Annual Symposium');
INSERT INTO "PROFESSOR" VALUES (19240,'David','Michael','Reed','Batelle 102',4313412124,'Computer Science');
INSERT INTO "PROFESSOR" VALUES (19241,'Paula','Nancy','Frederico','Batelle 104',2441489408,'Math');
INSERT INTO "PROFESSOR" VALUES (19242,'Christine','Marie','Anderson','Battelle 300',4792846738,'Biology');
INSERT INTO "PROFESSOR" VALUES (19243,'William','James','Clark','Battelle 204',3679027682,'Chemistry');
INSERT INTO "PROFESSOR" VALUES (19244,'Bonnie','Marie','Goodwin','Battelle 315',2789791463,'Athletic Training');
INSERT INTO "PROFESSOR" VALUES (19245,'Wendy','Grace','Blakely','Battelle 235',2684696967,'Nursing');
INSERT INTO "PROFESSOR" VALUES (19246,'Janette','Nicole','McDonald','Rener 103',1248274892,'Psychology');
INSERT INTO "PROFESSOR" VALUES (19247,'Julie','Emma','Dallas','Batelle 235',1247979166,'Exercise Science');
INSERT INTO "PROFESSOR" VALUES (19248,'Kevin','Michael','Griffith','CMC 244',7877141444,'English');
INSERT INTO "PROFESSOR" VALUES (19249,'Nathan','Alex','Anders','Conn 122',1487128764,'Music');
INSERT INTO "PROFESSOR" VALUES (19250,'Lynn','Joe','Dailey','Troutman 124',1241286241,'Business');
INSERT INTO "PROFESSOR" VALUES (19251,'Sally','Caroline','Creasap','Ruff 123',1241287817,'Education');
INSERT INTO "PROFESSOR" VALUES (19252,'Stephen','Bryce','Bruning','CMC 224',1248768124,'Communication');
INSERT INTO "PROFESSOR" VALUES (19253,'Wray','Jason','Bryant','Kairns 184',12412858585,'Religion');
INSERT INTO "PROFESSOR" VALUES (19254,'Andrew','Fred','Carlson','Rener 193',58592353235,'History');
INSERT INTO "PROFESSOR" VALUES (19255,'Megan','Lynn','Beard','Batelle 384',12478294790,'Exercise Science');
INSERT INTO "PROFESSOR" VALUES (19256,'Claire','Grace','Adams','Troutman 132',12441424792,'Business');
INSERT INTO "PROFESSOR" VALUES (19257,'Reginald','Jacob','Dyck','CMC 210',85783957843,'English');
INSERT INTO "PROFESSOR" VALUES (19258,'John','Patrick','Stadler','Batelle 109',30580385083,'Math');
INSERT INTO "PROFESSOR" VALUES (19259,'Craig','Henry','Burgdoff','Kairns 122',56395121242,'Religion');
INSERT INTO "PROFESSOR" VALUES (19260,'Denvy','Patricia','Bowman','Rener 123',5648576243,'History');
INSERT INTO "PROFESSOR" VALUES (19261,'Jack','Daniel','Wilson','Batelle 342',4637596836,'Exercise Science');
INSERT INTO "PROFESSOR" VALUES (19262,'Elizabeth','Darcy','Beggrow','Battelle 332',4563758915,'Biology');
INSERT INTO "PROFESSOR" VALUES (19263,'Cathy','Betty','Bruning','CMC 278',4567933266,'Communication');
INSERT INTO "PROFESSOR" VALUES (19264,'Fred','George','Linder','Batelle 134',5674937543,'Chemistry');
INSERT INTO "PROFESSOR" VALUES (19265,'Jacob','Tracy','Underwood','Conn 124',9654738467,'Music');
INSERT INTO "PROFESSOR" VALUES (19266,'Eric','Richard','Anderson','Rener 234',4759067174,'Psychology');
INSERT INTO "PROFESSOR" VALUES (19267,'Li','Grace','Feng','Batelle 111',4759208579,'Computer Science');
INSERT INTO "PROFESSOR" VALUES (19268,'Carmen','Ryan','Dixon','Ruff 153',2537584957,'Education');
INSERT INTO "PROFESSOR" VALUES (19269,'Renne','Jean','Dunnington','Battelle 352',8375856473,'Nursing');
INSERT INTO "DEPARTMENT" VALUES (1234,'Computer Science','Battelle','01/01/2018',19240);
INSERT INTO "DEPARTMENT" VALUES (4321,'Math','Battelle','02/07/2015',19241);
INSERT INTO "DEPARTMENT" VALUES (8756,'Chemistry','Battelle','06/09/2008',19243);
INSERT INTO "DEPARTMENT" VALUES (9876,'Biology','Battelle','12/12/2012',19242);
INSERT INTO "DEPARTMENT" VALUES (7722,'Psychology','Rener','03/14/2014',19246);
INSERT INTO "DEPARTMENT" VALUES (1048,'Nursing','Battelle','11/11/2011',19245);
INSERT INTO "DEPARTMENT" VALUES (1542,'Athletic Training','Battelle','14/14/2018',19244);
INSERT INTO "DEPARTMENT" VALUES (2344,'Exercise Science','Batelle','10/10/2009',19247);
INSERT INTO "DEPARTMENT" VALUES (8364,'English','CMC','10/14/2013',19248);
INSERT INTO "DEPARTMENT" VALUES (5194,'Music','Conn','12/20/2015',19249);
INSERT INTO "DEPARTMENT" VALUES (1820,'Business','Troutman','11/17/2017',19250);
INSERT INTO "DEPARTMENT" VALUES (9712,'Education','Ruff','03/12/2014',19251);
INSERT INTO "DEPARTMENT" VALUES (1972,'Communication','CMC','04/29/2018',19252);
INSERT INTO "DEPARTMENT" VALUES (5232,'Religion','Kairns','05/14/2015',19253);
INSERT INTO "DEPARTMENT" VALUES (3923,'History','Rener','02/17/2017',19254);
INSERT INTO "SYMPOSIUM" VALUES ('2020 Annual Symposium','04/19/2020','Capital Center','Obama','Absolute Lymphocyte Count and Bone Marrow Transplant');
COMMIT;

