# Bradley Antholz's 2025 Resume

---
# Part 1: Background
## 📌 The Basics: Work Experience & Skills  
**Work Experience:**
- 1. Village Inn (sit-down restaurant), Dishwasher, from April 2021 to ~May 2022. Worked my way to a raise after 6 months and learned almost everything within the kitchen, including: cooking, cleaning, hosting, cashiering and many more.

- 2. The Home Depot (retail), Order Fulfillment, from May 2022 to June 2023. Worked all around the store and learned many, many departments including (but not limited to): Garden, Hardware/Tools, Electrical. 

- 3. Lowe's (retail), Hardware/Tools, from July 2023 to Present (will be leaving in May). Same story as THD, but was able to stay at the same store for almost two years straight. Learned how to crisis manage, create leads & details (big money), and sell appliances! Achievements: Platinum service star award, several name mentions in customer surveys, mastered customer service and applied 5+ customers for Lowe's credit cards. 

**Skills applicable to job market:**

- Computer savvy: I've had a laptop since I was 13, and know how to help with not just computer but other electronic problems. Became the "go-to guy" at work & home for fixing random issues with computers.
  
- Love to learn: This skill really blossomed when I started working, as I love to learn new things out of both curiosity and a drive to help. If it helps, I want to learn it!
  
- Adaptability: When working in retail, this skill is a must-have. This also goes hand-in-hand with loving to learn, but there were days at THD that I would move from order fulfillment to hardware to lumber back to orders then to cashiering. I can do this not because I have to but because I want to.
  
- Crisis management: Although I have never been in a real position of power, I have found myself in countless situations that warrant acting like one. I have a natural ability to break down a chaotic time and figure out the best way forward (for example: one night at Lowe's, I was asked to help in 4 different places at once, so I said "Who needs help first? Second?" and we were able to tackle all of the issues in a timely manner.
  
- Team-player: Same old story as everyone else, except with the story above I have many examples of myself either being the leader or doing what is asked by authority. Managers (especially at Lowe's) come to me with many, many tasks because they know I will be able to handle it and complete it the right way. 


---

## 🎓 Ghost of Past, Present and Future...College! 
**Past College:**
  * Graduated from Iowa Western Community College in May 2023 with a degree in Communications. Joined Phi Theta Kappa, a society for elite CC students in January 2023 with my GPA topping out at 3.9. Took classes such as Media Writing, Photography, Intro to Mass Media and many more. 

**Current School:**
  * Drake University in Des Moines, IA. Came in not having a clear vision of the future yet leaving this year with a fun yet treacherous path. Will graduate in December 2025 with a Bachelor's degree in Data Analytics. 

**Future Plans:**   
  * I plan on attending the University of Nebraska-Omaha in Fall 2026 to pursue a master's degree in artificial intelligence with no specified area of study as of now. Beyond this depends on what happens while I'm there!
---
# Part 2: Experience
## 💼 Experience Breakdown  
### 💻 Now, lets talk coding and machine learning

#### Platforms/Softwares I've coded on (defined by skill level):
- Advanced: R Studio 
- Intermediate: VS Code, Colab, AWS Terminal
- Basic: Thonny, Visio, VDI

#### My best three coding languages, in order:

**R:** 
- Here are some examples of graphs I made in R Studio for my capstone class. I have permission from the professor to show this as well!
- Screenshot of this code: ![image](https://github.com/user-attachments/assets/5736ce68-ca36-4887-b84e-179c69ec03ba)
![image](https://github.com/user-attachments/assets/83cda0ec-dcee-4f9b-812f-d2d7b6adf155)

- Screenshot of this code: ![image](https://github.com/user-attachments/assets/127232a7-241c-4347-8333-1590996940a7)
![image](https://github.com/user-attachments/assets/6b110001-1cb5-4f15-841f-71a9afb680ab)


**SQL:**
Here are examples of some questions from labs I've done in my class "Cloud and Database Systems", with permission from Professor Moore (in my references sections
* Question: SELECT sID, sName, GPA, sizeHS, ROUND(GPA*(sizeHS/1000.0),2) as scaledGPA FROM Student;
  Modify the above query so that the table headings are: ID, name, GPA, sizeHS, and scaledGPA. Order by descending scaledGPA. Round the scaledGPA to 1 decimal place.
  
* Response:
  mysql> SELECT sID as ID, sName as name, GPA, sizeHS, ROUND(GPA*(sizeHS/1000.0),1) as scaledGPA

  -> FROM Student

  -> ORDER BY scaledGPA desc;


* Question: What are the names of the Tracks that are in the Playlist Named "Grunge"?

* Response:
  mysql> Select T.Name

  -> From Track T, Playlist P Join PlaylistTrack PT 

  -> Where PT.PlaylistId = P.PlaylistId and T.TrackId = PT.TrackId and P.Name = 'Grunge';


**Python:** These are courses I've taken that use python: Computer Science I & II, Machine Learning, Artificial Intelligence and Cloud and Database Systems. However, I am aware that it is not my strong suit, and because of this I am willing to get any certifications needed for the future. Currently looking at improving my skills with online courses. 


---
# Part 3: References and Information
## 🚀 What I am after in the job market  
- ✅ I am looking for a paid intership/work in the Data analytics or artifical intelligence fields that fit my skills and experience. 
- ✅ I am unable to relocate at this time, as I am in college in Des Moines right now and Omaha in 2026. Despite that, I am willing to commute within each city and/or remote work. 
- ✅ Full-time work, or as much as possible. 

---

## 🎯 References & Closing
- Professor Moore, Assistant Professor of Computer Science at Drake University.
  - email: meredith.moore@drake.edu
  - phone: (515) 271-3110
  - know from: CS I, Human-Computer Interactions and Cloud and Datase Systems courses.

- Professor Porter, Associate Professor of Mathematics, Head of AI Department at Drake University.
  - email: christopher.porter@drake.edu
  - phone: (515) 271-3041
  - know from: AI minor advisor, Interdisiplinary Perspectives on Artificial Intelligence, Generative AI: Theory and Practice and Artificial Intelligence courses.

- Timothy Urness, Professor of Computer Science at Drake University.
  - email: timothy.urness@drake.edu
  - phone: (515) 271-2118
  - know from: Data Analytics major advisor, been a huge help in knowing my classes at Drake. 

- Kevin Franks, Supervisor of Hardware & Tools, Lowe's Inc.
  - email: kevin.franks@stores.lowes.com
  - phone: (563) 344-9000
  - know from: My direct supervisor at Lowe's for over a year. 

**Special thanks to Professor Manley and Professor Follett, who gave me permission to use R code and graphs from my capstone, as well as Professor Moore for her permission to use the labs in Cloud and Database Systems.**
