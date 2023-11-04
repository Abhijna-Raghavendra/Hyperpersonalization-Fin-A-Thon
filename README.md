# Hyperpersonalisation

# Introduction
In our pursuit to revolutionize the banking experience, we are committed to developing an innovative and efficient banking platform. This endeavor involves the integration of cutting-edge personalization algorithms, as well as the implementation of a robust data storage and retrieval middleware. 

The existing banking applications exhibit several significant shortcomings and areas in need of enhancement, which can potentially be exploited or lead to operational inefficiencies. In response, our primary objective is to address and rectify these issues by employing a secure middleware solution, powered by the Django framework, and fortified with multiple layers of encryption to ensure the highest level of data security.

The existing banking applications exhibit several significant shortcomings and areas in need of enhancement, which can potentially be exploited or lead to operational inefficiencies. In response, our primary objective is to address and rectify these issues by employing a secure middleware solution, powered by the Django framework, and fortified with multiple layers of encryption to ensure the highest level of data security.
Furthermore, we are introducing novel approaches to personalization, with a focus on delivering a significantly more user-friendly and intelligent platform for our customers. Our goal is to create a banking app that not only meets but exceeds the expectations of today's tech-savvy consumers, providing them with a seamless and personalized banking experience.

# Problems

1. *Foster User-Centric Design*: To create a truly user-friendly banking app, it is essential to consider user research, personas, and user journey mapping. By understanding customer pain points, preferences, and behaviors, we aim to design an app that offers a seamless and intuitive user experience. This experience should adapt to individual users' financial goals and preferences, ensuring their needs are met effectively.
2. *Personalized Insights and Recommendations*: The next challenge is to provide customers with detailed insights into their spending habits, breakdowns of spending categories, analyses of saving patterns, and tailored recommendations for various financial products, including credit cards, loans, investments, and money-saving strategies. The app should serve as a financial advisor, helping users make informed decisions.
3. *Financial Goal Tracking and Visualization*: Users often struggle with tracking their financial goals. This problem can be solved by enabling tools for setting and tracking financial goals within the app. Users should be able to visualize their progress and receive notifications that keep them motivated and on track.
4. *Enhanced Spending Analysis*: To better understand and manage their finances, users need access to interactive charts, categorization of expenses, and comparative analysis tools. These features will empower users to make more informed financial decisions.
5. *AI-Powered Virtual Assistant*: Implementing an AI-driven virtual assistant is essential to enhance the customer experience. This virtual assistant should be capable of understanding natural language queries, providing personalized responses, and offering financial guidance, thereby creating a personalized and interactive banking experience.
6. *Personalized Credit Score Monitoring*: In an era of financial awareness, users expect real-time credit score tracking, in-depth analysis, and personalized recommendations for improving their creditworthiness. This feature will help users make more informed decisions about their credit.
7. *Security and Privacy*: Last but not least, security and privacy are paramount. The app should prioritize robust security measures to protect users' financial data and ensure secure transactions. It should adhere to the basic guidelines set by the Reserve Bank of India (RBI) to maintain the trust and confidence of users. 

# Solution

## Insights Tab
Our foremost goal is to establish a secure, reliable, and user-centric banking environment, fostering trust and well-informed financial decisions. To achieve this, we prioritize consistent updates and valuable insights, encouraging meaningful user interactions. Our "Insights" feature allows users to monitor balances and manage expenses, with a visual graph categorizing spending areas. Additionally, we enable users to set and track financial goals, empowering efficient savings and financial management. A budget tool assists in maintaining spending control, sending alerts for budget breaches. These features enhance the overall user experience, promoting security, financial responsibility, and the realization of aspirations.

## Security

Privacy is integral to instilling user trust in a banking app, promoting consistent usage. Despite its significance, the persistent threats of phishing and security breaches have resulted in financial losses for unsuspecting users. In response, we're fortifying our banking app's security with a multi-layered approach via secure protocols.

These protocols encompass user verification methods like MPIN, facial recognition (Face ID), and fingerprint scans. When suspicious activity or unauthorized access is detected, the system activates protective measures. These may entail temporarily suspending account transactions, either per the user's preference or default settings. Furthermore, these security protocols extend to safeguard sensitive user data, preventing inadvertent data leaks.

By integrating these enhancements, we offer users peace of mind, ensuring the safety of their finances and confidential information within our banking app.

## Chatbot(Virtual Assistant)

To enhance the user experience in their banking interactions, we have introduced an efficient virtual assistant within the app. This virtual assistant is specifically designed to assist users who may not be well-versed in banking terminology and could potentially feel overwhelmed by the extensive information available on the internet. Our primary goal is to simplify the banking experience by offering clear and concise responses to user queries. This approach is intended to make banking more accessible and user-friendly, ultimately attracting a broader customer base to our bank.

## Offers

We provide our customers with personalized recommendations by monitoring their expenses. Banks often present a range of offers in various industries, such as health, travel, online shopping, and more. Our aim is to keep our customers informed about these offers, particularly in sectors they frequently engage with. This way, they can take advantage of opportunities to purchase items at a price lower than their original cost. In addition, we also display industry-specific offers that we offer to our users, enabling them to explore a wider range of options and select the products that align best with their preferences and needs.

## Dashboard

In addition to personalized guidance and virtual assistance, we recognize the importance of providing users with a comprehensive insight dashboard that offers an exceptional user experience. This dashboard will empower users to monitor their financial transactions, track their financial goals, and stay informed about their financial health. Leveraging machine learning algorithms, we will customize the dashboard according to each user's preferences, and we will also provide reminders and alerts for exceeding spending limits and notifications for any anomalous activities. This feature not only enhances the user experience but also plays a vital role in ensuring the financial well-being and security of our users.

Figma design link - https://www.figma.com/file/qU5ZrWO12C5ttvf7uVycRF/SIB-Mirror%2B-Revamp?type=design&node-id=21-277&mode=design&t=BEXbd0glpFTW5V01-0

Figma Prototype Link - https://www.figma.com/proto/qU5ZrWO12C5ttvf7uVycRF/SIB-Mirror%2B-Revamp?type=design&node-id=21-277&t=BEXbd0glpFTW5V01-0&scaling=min-zoom&page-id=21%3A276&starting-point-node-id=21%3A277

## ANALYSING POSSIBLE REASONS FOR CHANGE
We utilize the CIBIL score as our primary credit assessment parameter, which is generated on a monthly basis by CIBIL. Our application diligently tracks the user's CIBIL score each month, conducts a thorough analysis of the data, and employs our machine learning algorithm to offer insights into the potential reasons for fluctuations. These reasons may encompass late EMI payments, hard inquiries or loan applications, debt settlements, and more. Additionally, we provide users with pertinent educational articles on these subjects to guide them in boosting their credit score.

## GRAPHICAL DEPICTION
We also provide graphical representations of the evolving credit scores, enabling users to assess their credit performance throughout the year. If the graph exhibits a consistent downward trend with minor fluctuations, it may be indicative of high credit utilization ratios. In such cases, we offer suggestions for diversifying the credit mix.

## CREDIT SCORE SIMULATOR
Recognizing past mistakes is valuable, but it's equally important to equip users with the ability to make informed decisions. To address this need, we've developed a Credit Score Simulator. This simulator allows users to estimate their potential future credit scores based on the actions they plan to take.


## Setup Repository

1. Clone the repository
    ```sh
    git clone https://github.com/Abhijna-Raghavendra/Hyperpersonalization-Fin-A-Thon.git
    ```

2. Setup Mobile Application on Client Device 
    > Make sure your system has [Flutter](https://flutter.dev/) and [Dart](https://dart.dev/) installed and configured on your system. *If **not**, follow the instructions [here](https://dev.to/sarangpratham/setup-flutter-with-vs-code-1agb)*

    > *All further instructions are to be performed in the ```mobile/``` directory.*
    - Install dependencies
        ```dart
        flutter pub get
        ```
        Refer to [this](https://stackoverflow.com/a/54526682) for more instructions.

    - Run the app
        ```dart
        flutter run
        ```

3. Setup the server-side application
    > *Setup using docker* : Make sure you have [docker desktop](https://www.docker.com/products/docker-desktop/) on your system
    
    > *All further instructions are to be performed in the ```server/``` directory.*

    - Build the Image
        ```sh
        docker compose up --build
        ```
    *You should be able to see the application running on **port 8000***


## Prototype-Demo

https://github.com/Abhijna-Raghavendra/Hyperpersonalization-Fin-A-Thon/assets/96530830/2f6a282c-3399-4bee-bc47-a0d9b666dd50



## Contributors
|![Abhijna Raghavendra](https://github.com/Abhijna-Raghavendra.png?size=200)|![Anjali](https://github.com/anjaliagg1012.png?size=200)|![Manyana Tiwari](https://github.com/manyana72.png?size=200)|![Nishcay Garg](https://github.com/gargnishchay13.png?size=200)|![Singamsetti Vyusti](https://github.com/SVyusti.png?size=200)|
|-------|-------|-------|-------|-------|
| [Abhijna Raghavendra](https://github.com/Abhijna-Raghavendra) | [Anjali](https://github.com/anjaliagg1012) | [Manyana Tiwari](https://github.com/manyana72) | [Nishchay Garg](https://github.com/gargnishchay13) | [Vyusti Singamsetti](https://github.com/SVyusti) |
