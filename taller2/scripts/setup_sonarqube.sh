#!/bin/bash

SONAR_URL="http://localhost:9000"
USER="admin"
PASS="admin"

echo "Creating Quality Gate..."
curl -u "$USER:$PASS" -X POST "$SONAR_URL/api/qualitygates/create" -d "name=QualityTaller2"

add_condition() {
    metric=$1
    op=$2
    val=$3
    echo "Adding condition: $metric $op $val"
    curl -u "$USER:$PASS" -X POST "$SONAR_URL/api/qualitygates/create_condition" \
        -d "gateName=QualityTaller2" \
        -d "metric=$metric" \
        -d "op=$op" \
        -d "error=$val"
}

add_condition "blocker_violations" "GT" "5"
add_condition "bugs" "GT" "0"
add_condition "code_smells" "GT" "20"
add_condition "coverage" "LT" "70"
add_condition "new_coverage" "LT" "75"
add_condition "critical_violations" "GT" "10"
add_condition "new_duplicated_lines_density" "GT" "3"
add_condition "sqale_rating" "GT" "1"
add_condition "new_maintainability_rating" "GT" "1"
add_condition "major_violations" "GT" "15"
add_condition "new_blocker_violations" "GT" "0"
add_condition "reliability_rating" "GT" "1"
add_condition "new_reliability_rating" "GT" "1"
add_condition "security_rating" "GT" "1"
add_condition "new_security_rating" "GT" "1"

echo "Setting as default..."
curl -u "$USER:$PASS" -X POST "$SONAR_URL/api/qualitygates/set_as_default" -d "name=QualityTaller2"

echo "SonarQube setup complete."
