Hospital Dashboard Project
Overview
This project is a comprehensive hospital management dashboard designed to streamline patient, doctor, and financial data. It includes multiple dashboards for patients, finance, doctors, and an overview, along with a MySQL database schema to manage the data efficiently.
Features

Patient Dashboard: Displays patient details, admission/discharge status, surgery information, and feedback.
Finance Dashboard: Tracks estimated patient amounts, medicine sales, doctor/staff salaries, and stock status.
Doctor Dashboard: Manages doctor availability, qualifications, commissions, and patient appointments.
Overview Dashboard: Provides a high-level view of patient discharges, stock, ratings, and sales targets.
Information Dashboard: Categorizes patients by age, tracks surgery details, and monitors staff and bed occupancy.
MySQL Views: Includes pre-defined views for medical stock information and integrated patient-doctor-surgery-billing details.

Installation

Clone the repository:git clone https://github.com/maantyagi/Hospital_Dashboard


Navigate to the project directory:cd hospital-dashboard


Set up the MySQL database:
Install MySQL on your system.
Create a new database and import the provided SQL views.


Configure the application (if applicable) with your database credentials.

Usage

Access the dashboards through the provided interface.
Use the MySQL views to query and manage hospital data efficiently.
Update the SQL views as needed to reflect changes in the database schema.

Database Schema

The project includes two main MySQL views:
medical_stock_info: Combines medical stock and supplier details.
hospital_patient_details: Integrates patient, doctor, bed, room, surgery, and billing information.



Contributing
Feel free to fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.
License
This project is licensed under the MIT License - see the LICENSE.md file for details.
Acknowledgments

Thanks to the open-source community for MySQL and other tools used in this project.
