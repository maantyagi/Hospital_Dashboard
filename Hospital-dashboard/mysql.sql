-- 🏥 Step 1: Create Views in MySQL
-- 📦 View 1: Medical Stock Information
-- This view combines medical stock and supplier info:

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `medical_stock_info` AS
    SELECT 
        m.id AS id,
        m.medicine_id AS medicine_id,
        m.name AS name,
        m.category AS category,
        m.supplier_id AS supplier_id,
        m.cost_price AS cost_price,
        m.unit_price AS unit_price,
        m.stock_qty AS stock_qty,
        m.expiry_date AS expiry_date,
        m.manufacture_date AS manufacture_date,
        m.batch_number AS batch_number,
        m.reorder_level AS reorder_level,
        s.name AS supplier_name
    FROM medical_stock m
    LEFT JOIN supplier s ON m.supplier_id = s.supplier_id;
-- 🏨 View 2: Patient, Doctor, Beds, Surgery, Billing (All-in-One)
-- This complex view integrates patient info with doctors, rooms, surgeries, and billing:

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER  
VIEW `hospital_patient_details` AS
SELECT
    -- Patient Info
    p.patient_id AS patient_patient_id,
    p.name AS patient_name,
    p.gender AS patient_gender,
    p.weight AS patient_weight,
    p.age AS patient_age,
    p.blood_group AS patient_blood_group,
    p.email AS patient_email,
    p.admission_date AS patient_admission_date,
    p.discharge_date AS patient_discharge_date,
    p.address AS patient_address,
    p.status AS patient_status,
    CASE 
      WHEN b.bed_id IS NULL THEN 'Discharge' 
      ELSE 'Admitted' 
    END AS patient_admission_status,
    -- Doctor Info
    dr.doctor_id AS doctor_doctor_id,
    dr.name AS doctor_name,
    dr.salary AS doctor_salary,
    dr.specialization AS doctor_specialization,
    dr.department AS doctor_department,
    dr.availability AS doctor_availability,
    dr.joining_date AS doctor_joining_date,
    dr.qualification AS doctor_qualification,
    dr.experience_years AS doctor_experience_years,
    dr.email AS doctor_email,
    dr.phone AS doctor_phone,
    -- Bed Info
    b.bed_id AS beds_bed_id,
    b.occupied_from AS beds_occupied_from,
    b.occupied_till AS beds_occupied_till,
    b.status AS beds_status, 
    -- Room Info
    r.room_id AS room_room_id,
    r.floor AS room_floor,
    r.room_type AS room_room_type,
    r.capacity AS room_capacity,
    r.daily_charge AS room_daily_charge,
    r.avgmontlymaintenancecost AS room_avgmontlymaintenancecost,
    r.status AS room_status,
    -- Department Info
    dep.department_id AS department_department_id,
    dep.name AS department_name,
    dep.total_staff AS department_total_staff,
    -- Satisfaction Score
    s.satisfaction_id AS satisfaction_satisfaction_id,
    s.rating AS satisfaction_rating,
    s.feedback AS satisfaction_feedback,
    -- Surgery Info
    sur.appointment_id AS surgery_appointment_id,
    sur.appointment_date AS surgery_appointment_date,
    sur.appointment_time AS surgery_appointment_time,
    sur.status AS surgery_status,
    sur.reason AS surgery_reason,
    sur.notes AS surgery_notes,
    -- Billing Info
    hb.room_charges,
    hb.surgery_charges,
    hb.medicine_charges,
    hb.test_charges,
    hb.doctor_fees,
    hb.other_charges,
    hb.total_amount,
    hb.discount,
    hb.paid_amount,
    hb.payment_method,
    hb.payment_status
FROM patient p 
LEFT JOIN satisfaction_score s ON p.patient_id = s.patient_id
LEFT JOIN surgery sur ON sur.patient_id = p.patient_id
LEFT JOIN hospital_bills hb ON hb.patient_id = p.patient_id
LEFT JOIN beds b ON b.patient_id = p.patient_id
LEFT JOIN rooms r ON r.room_id = b.room_id
LEFT JOIN department dep ON dep.department_id = r.department_id
LEFT JOIN (
    SELECT DISTINCT patient_id, doctor_id 
    FROM appointment
) a ON a.patient_id = p.patient_id
LEFT JOIN doctor dr ON dr.doctor_id = a.doctor_id;