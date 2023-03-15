# Queueing-System

## Random Number Generators
To use the queueing system, users must first type in the number of patients. The number of patients is important since the system would need to generate the random number. Then, the user can choose two choices of random number generator.

## Round Robin
For this queue system was simulated according to the round robin waiting line rule where the first patient is sent to Kiosk 1 and the second to Kiosk#2, the third to Kiosk#1, the fourth to Kiosk#2, and so on. After the user typed the number of patients and chose choice 1.

## Idle Kiosk
For the idle queue system, it was simulated according to idle waiting line rule where the patient would be send to the kiosk whenever each of the 2 kiosk is available, if both of the kiosks is available, then send the patient to Kiosk#1. The waiting line rule is a little similarly to first come first serve. In the system, users are prompted to enter the number of patients and choose choice 2 as it is
for idle kiosk waiting line rule.

## Performance Measures
Both systems round robin and idle kiosk were tested with the same amount of patients which is 26 patients. Average time of the round robin system is 0.6538 where average waiting time of idle kiosk is at 0. This means the idle kiosk system is more efficient since the waiting time is zero. The average time spent in the registration system for both systems is near where round robin is 2.4615 shorter than idle kiosk which is 3.1538. Since the average waiting time for an idle kiosk is 0, then the probability of waiting is zero while the probability of waiting for round robin is as the same as the average waiting time which is 0.6538. The average service time of kiosk 1 is 2.5385 and service time of kiosk 2 is 2.5385 for round robin system is less than idle kiosk average service time for kiosk 1 and 2 which is 5.5556 and 3.5556.
