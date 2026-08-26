#! /bin/bash

psql --username=freecodecamp --dbname=postgres -c "CREATE DATABASE IF NOT EXISTS salon;"

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c "

$PSQL "CREATE TABLE IF NOT EXISTS customers(
  customer_id SERIAL,
  phone VARCHAR(10) UNIQUE,
  name VARCHAR(50),
  PRIMARY KEY(customer_id)
);"

$PSQL "CREATE TABLE IF NOT EXISTS services(
  service_id SERIAL,
  name VARCHAR(10) UNIQUE NOT NULL,
  PRIMARY KEY(service_id)
);"

$PSQL "CREATE TABLE IF NOT EXISTS appointments(
  appointment_id SERIAL,
  customer_id INT,
  service_id INT,
  time VARCHAR(8),
  PRIMARY KEY(appointment_id),
  FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY(service_id) REFERENCES services(service_id)
);"

# since the 'name' column has UNIQUE constraint, the INSERT INTO is not repeated if the script is run more than once!
$PSQL "INSERT INTO services(name)
VALUES('cut'),
  ('color'),
  ('perm'),
  ('style'),
  ('trim');"

# Database created successfully!
# OUTPUT of our bash script:

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

# Validate service number
while true
do
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED

  if [[ $SERVICE_ID_SELECTED -ge 1 && $SERVICE_ID_SELECTED -le 5 ]]
  then
    break
  fi

  echo "I could not find that service. What would you like today?"
done

# Get service name
SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# Look for existing customer
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_NAME ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
fi

echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
read SERVICE_TIME

# Get customer ID
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

$PSQL "INSERT INTO appointments(customer_id, service_id, time)
VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"

echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."