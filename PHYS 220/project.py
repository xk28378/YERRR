# -*- coding: utf-8 -*-
"""
Created on Mon Apr 18 18:46:21 2022

@authors: Nem Negash, Tuba Tanveer, Kaitlyn Keaton
"""

from rocketpy import Environment, Rocket, SolidMotor, Flight
import datetime

Env = Environment(
    railLength=5.2,
    latitude=39.2904,
    longitude=76.6122,
    elevation=33# Tomorrow's date in year, month, day, hour UTC format
)

tomorrow = datetime.date.today() + datetime.timedelta(days=14)
print(tomorrow);

Env.setDate(tomorrow.year, tomorrow.month, tomorrow.day, 12)  # Hour given in UTC time
Env.setAtmosphericModel(type="Forecast", file="GFS")
Env.info();

Pro75M1670 = SolidMotor(
    thrustSource="Cesaroni_M1670.eng",
    burnOut=3.9,
    grainNumber=5,
    grainSeparation=5 / 1000,
    grainDensity=1815,
    grainOuterRadius=33 / 1000,
    grainInitialInnerRadius=15 / 1000,
    grainInitialHeight=120 / 1000,
    nozzleRadius=33 / 1000,
    throatRadius=11 / 1000,
    interpolationMethod="linear",
)

Calisto = Rocket(
    motor=Pro75M1670,
    radius=127 / 2000,
    mass=19.197 - 2.956,
    inertiaI=6.60,
    inertiaZ=0.0351,
    distanceRocketNozzle=-1.255,
    distanceRocketPropellant=-0.85704,
    powerOffDrag="powerOffDragCurve.csv",
    powerOnDrag="powerOnDragCurve.csv",
)

Calisto.setRailButtons([0.2, -0.5]);

NoseCone = Calisto.addNose(length=0.55829, kind="vonKarman", distanceToCM=0.71971)

FinSet = Calisto.addFins(
    4, span=0.100, rootChord=0.120, tipChord=0.040, distanceToCM=-1.04956
)

Tail = Calisto.addTail(
    topRadius=0.0635, bottomRadius=0.0435, length=0.060, distanceToCM=-1.194656
)

def drogueTrigger(p, y):
    # p = pressure
    # y = [x, y, z, vx, vy, vz, e0, e1, e2, e3, w1, w2, w3]
    # activate drogue when vz < 0 m/s.
    return True if y[5] < 0 else False


def mainTrigger(p, y):
    # p = pressure
    # y = [x, y, z, vx, vy, vz, e0, e1, e2, e3, w1, w2, w3]
    # activate main when vz < 0 m/s and z < 800 m.
    return True if y[5] < 0 and y[2] < 800 else False


Main = Calisto.addParachute(
    "Main",
    CdS=10.0,
    trigger=mainTrigger,
    samplingRate=105,
    lag=1.5,
    noise=(0, 8.3, 0.5),
)

Drogue = Calisto.addParachute(
    "Drogue",
    CdS=1.0,
    trigger=drogueTrigger,
    samplingRate=105,
    lag=1.5,
    noise=(0, 8.3, 0.5),
)
TestFlight = Flight(rocket=Calisto, environment=Env, inclination=85, heading=0)
TestFlight.allInfo()
