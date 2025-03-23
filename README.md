# Bradley Antholz's 2025 Resume


---
# Part 1: Background
**Work Experience:**
1. Village Inn (sit-down restaurant), Dishwasher, from April 2021 to May 2022.
     * Achievements: Earned a raise after 6 months, learned the entire restaurant including: Prep, Cook, Host, Waiter, Truck, Busser, Expo. 

2. The Home Depot (retail), Order Fulfillment, from May 2022 to June 2023.
     * Achievements: Multiple name mentions in customer surveys, learned departments including but not limited to: Customer service, Hardware, Garden, Lumber, Electrical.
    
3. Lowe's (retail), Hardware/Tools, from July 2023 to Present.
     * Achievements: Platinum service star award, several name mentions in customer surveys, mastered customer service, applied 5+ customers for Lowe's credit cards, learned departments (not included above): Appliances, Cashier, Millwork, Paint.
---

## 🎓 Education
1. Iowa Western Community College (August 2021-May 2023). Associates degree in Communications.
   * 3.9 GPA, joined Phi Theta Kappa in January 2023. Took classes such as: Media Writing, Intro to Mass Media, Photography, Photojournalism.

2. Drake University (August 2023-December 2025). Bachelors degree in Data Analytics.
   * Relevant classes: Machine Learning, CS I & II, Calculus 1-4, Artificial Intelligence, Regression & Time Series, Generative AI, Cloud and Database Systems.

* I plan on attending the University of Nebraska-Omaha for a master's degree in Artifical Intelligence. 
---

# Part 2: Experience

**Proficiency:**
* R: Learned from: Regression & Time Series, Case Studies in Data Analytics, Intro to R and SAS.
    * Example from Case Studies in Data Analytics:
      ```r
      # Separate income into brackets for easier analysis
      data <- data %>%
      mutate(
        income_bracket = case_when(
          annual_income == 0 ~ "No Income",
          annual_income <= 5000 ~ "$0 - $5,000",
          annual_income <= 10000 ~ "$5,000 - $10,000",
          annual_income <= 20000 ~ "$10,000 - $20,000",
          annual_income <= 50000 ~ "$20,000 - $50,000",
          annual_income <= 100000 ~ "$50,000 - $100,000",
          TRUE ~ "Over $100,000"
        )
      )
      
* SQL: Learned from: Database Management, Cloud and Database Systems.
    * Example from Cloud and Database Systems:
      ```sql
      # What are the sIDs, sNames, GPA, cNames, and state for all students in the database with a
      # GPA greater than 3.75 that applied to a college in the state of CA? Display only distinct values.
      Select distinct S.sID, sName, GPA, C.cName, state
      From Student S, College C, Apply A
      Where S.sID = A.sID and C.cName = A.cName and GPA > 3.75 and state = 'CA';
    
* VS Code: Learned from: CS II, Cloud and Database Systems, Human-Computer Interactions.


**Intermediate:**
* Python: Learned from: CS I & II, Machine Learning, Cloud and Database Systems, Artificial Intelligence
    * Example from Artificial Intelligence:
      ```python
      # Implementing an improvement to a hill climbing algorithm using a random seed
      import random

      tsp_instance = TravellingSalesAgentProblem(place="Des Moines, Iowa, USA", num_locations=10, random_seed=random.randint(0,10000))

      def test_hill_climbing():

      current_state = tsp_instance.get_destination_locations()
      while True:
          neighbor_state = best_successor(tsp_instance, current_state)
          if tsp_instance.route_travel_time(route=neighbor_state) >= tsp_instance.route_travel_time(route=current_state):
             break
             print("Local minima reached")
          current_state = neighbor_state

      return current_state

      best_state = test_hill_climbing()

      print("Successor state with the lowest travel time:", best_state)
      print("Travel time:", tsp_instance.route_travel_time(route=best_state))
      tsp_instance.display_map(route=best_state)

* Colab: Learned from: Machine Learning, Artificial Intelligence    
* AWS: Learned from: Cloud and Database Systems

**AI Models:**
* ChatGPT
* Gemini
* Claude
    * Example of all three from Generative AI:
      [My Digital Portfolio](https://docs.google.com/presentation/d/1gxxbLjbwrt-RHYnDgLavBps4qDukjjNavULU4iQdw-8/edit?usp=sharing)



---
# Part 3: References and Information

* Contact me:
    - email: bradley.antholz@gmail.com OR bradley.antholz@drake.edu
    - phone: 402-276-2555
    - LinkedIn page: [My profile](https://www.linkedin.com/in/bradley-antholz-078461300/)

References: 
* Professor Moore, Assistant Professor of Computer Science at Drake University.
  - email: meredith.moore@drake.edu
  - phone: (515) 271-3110
  - know from: CS I, Human-Computer Interactions and Cloud and Datase Systems courses.

* Professor Porter, Associate Professor of Mathematics, Head of AI Department at Drake University.
  - email: christopher.porter@drake.edu
  - phone: (515) 271-3041
  - know from: AI minor advisor, Interdisiplinary Perspectives on Artificial Intelligence, Generative AI: Theory and Practice and Artificial Intelligence courses.

* Timothy Urness, Professor of Computer Science at Drake University.
  - email: timothy.urness@drake.edu
  - phone: (515) 271-2118
  - know from: Data Analytics major advisor, been a huge help in knowing my classes at Drake. 

* Kevin Franks, Supervisor of Hardware & Tools, Lowe's Inc.
  - email: kevin.franks@stores.lowes.com
  - phone: (563) 344-9000
  - know from: My direct supervisor at Lowe's for over a year.


