# 🚦 Sensor-Based Adaptive Traffic Light Control System
### MATLAB Simulink | Control Systems Project
**Anna University Regional Campus, Coimbatore**
Department of Electronics Engineering (VLSI Design & Technology)

---

## 📌 Overview

A **Sensor-Based Adaptive Traffic Light Controller** designed and simulated using MATLAB Simulink. Unlike conventional fixed-time traffic signals, this system dynamically adjusts green signal duration based on real-time vehicle density input — reducing congestion and improving traffic flow efficiency.

---

## 👥 Team

| Name | Roll Number |
|------|-------------|
| Munis Sritharan G | 710024160012 |
| Vishnu Priyan M | 710024160026 |
| Yuvanesh T | 710024160027 |

**Date of Submission:** 17.02.2026

---

## 🎯 Objective

To design and simulate a sensor-based automatic traffic light control system that adjusts green signal timing according to vehicle density using MATLAB Simulink.

---

## ❗ Problem Statement

Conventional fixed-time traffic signals cause:
- Unnecessary waiting during low traffic
- Congestion during peak hours
- Increased fuel consumption
- Delay in emergency vehicle movement

**Solution:** An intelligent closed-loop adaptive control system that adjusts signal timing based on real-time traffic density.

---

## 🧠 Concepts Used

- Closed-Loop Feedback System
- Discrete-Time System
- Sequential Control System
- State Machine Logic
- Transfer Function Approximation

---

## ⚙️ System Design

### Controller Logic

```
Density Threshold = 0.5

If density > 0.5  →  High Traffic  →  Green Time = 20s
If density ≤ 0.5  →  Low Traffic   →  Green Time = 10s
Yellow duration   =  3s (fixed)
Total cycle       =  40s
```

### Signal States (Scope Output)
| Value | Signal |
|-------|--------|
| 1     | 🟢 Green |
| 2     | 🟡 Yellow |
| 3     | 🔴 Red |

### Transfer Function (Timing Delay Approximation)

$$G(s) = \frac{1}{Ts + 1}$$

Where **T = 10** (signal timing constant in seconds)

---

## 🔧 Tools Used

- MATLAB
- Simulink
- MATLAB Function Block
- Clock Block
- Step Block / Random Number Block
- Scope Block

---

## 📁 File Structure

```
traffic-light-controller-matlab/
│
├── smart_traffic.m         # Core MATLAB function (state machine logic)
├── traff.m                 # Transfer function script
├── trafficsimulation.m     # Standalone simulation runner (no Simulink needed)
│
├── images/
│   ├── block_diagram_1.jpg         # Simulink model — Step input
│   ├── block_diagram_2.jpg         # Simulink model — Random input
│   ├── scope_step_output.jpg       # Scope output — Step density
│   ├── scope_random_output.jpg     # Scope output — Random density
│   └── transfer_function_graph.jpg # Transfer function step response
│
└── README.md
```

---

## ▶️ How to Run

### Option 1 — Run MATLAB script directly (no Simulink needed)
```matlab
% In MATLAB command window:
trafficsimulation
```
This runs both simulations (step + random) and plots the outputs.

### Option 2 — Run Transfer Function plot
```matlab
traff
```

### Option 3 — Simulink Model
1. Open MATLAB
2. Open `Smart_Traffic_Light.slx`
3. Set Stop Time = `100`
4. Click **Run**
5. Open Scope to view signal output

---

## 📊 Simulation Results

### Block Diagram — Step Input (Density Step)
![Block Diagram 1](https://github.com/Srithar0906/Traffic-light-controller-Matlab/blob/main/images/block_diagram_1.jpeg)

### Scope Output — Step Input
![Scope Step](images/scope_step_output.jpg)

### Block Diagram — Random Density Input
![Block Diagram 2](images/block_diagram_2.jpg)

### Scope Output — Random Density
![Scope Random](images/scope_random_output.jpg)

### Transfer Function — Step Response
![Transfer Function](images/transfer_function_graph.jpg)

---

## 📈 Analysis

| Condition | Behaviour |
|-----------|-----------|
| Low traffic (density ≤ 0.5) | Normal green duration (10s) |
| High traffic (density > 0.5) | Extended green duration (20s) |
| Step input | Clean, stable periodic transitions |
| Random input | Rapid adaptive switching |

---

## 🚀 Future Scope

- Four-way intelligent junction control
- Emergency vehicle automatic priority override
- IoT-enabled real-time traffic monitoring
- AI-based traffic density prediction
- Two-road intersection model

---

## 📄 License

This project was submitted as part of the Control Systems course at Anna University Regional Campus, Coimbatore.
