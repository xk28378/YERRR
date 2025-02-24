######################################################################
# This file copyright the Georgia Institute of Technology
#
# Permission is given to students to use or modify this file (only)
# to work on their assignments.
#
# You may NOT publish this file or make it available to others not in
# the course.
#
######################################################################

# These import statements give you access to library functions which you may
# (or may not?) want to use.
import random
import time
from math import *
from body import *
from solar_system import *
from satellite import *


def estimate_next_pos(gravimeter_measurement, get_theoretical_gravitational_force_at_point, distance, steering, other=None):
    """
    Estimate the next (x,y) position of the satelite.
    This is the function you will have to write for part A.
    :param gravimeter_measurement: float
        A floating point number representing
        the measured magnitude of the gravitation pull of all the planets
        felt at the target satellite at that point in time.
    :param get_theoretical_gravitational_force_at_point: Func
        A function that takes in (x,y) and outputs a float representing the magnitude of the gravitation pull from
        of all the planets at that (x,y) location at that point in time.
    :param distance: float
        The target satellite's motion distance
    :param steering: float
        The target satellite's motion steering
    :param other: any
        This is initially None, but if you return an OTHER from
        this function call, it will be passed back to you the next time it is
        called, so that you can use it to keep track of important information
        over time. (We suggest you use a dictionary so that you can store as many
        different named values as you want.)
    :return:
        estimate: Tuple[float, float]. The (x,y) estimate of the target satellite at the next timestep
        other: any. Any additional information you'd like to pass between invocations of this function
        optional_points_to_plot: List[Tuple[float, float, float]].
            A list of tuples like (x,y,h) to plot for the visualization
    """
    # time.sleep(2)  # uncomment to pause for the specified seconds each timestep
    def random_sign():
        return 1 if random.random() > 0.5 else -1
    
    def get_fuzz_distance():
        return random_sign() * random.random() * 10.0e9
    def get_fuzz_angle():
        return random_sign() * random.random() * pi
    def move(particles, distance, steering):
        
        new_particles = []
        for x, y, theta in particles:
        
            radius = 10.2 / tan(steering)
            x_dis = sin(theta) * radius
            y_dis = cos(theta) * radius
            center_x = x - x_dis
            center_y = y + y_dis
            
            beta = distance / radius
            
            x_dis_new = sin(theta + beta) * radius
            y_dis_new = cos(theta + beta) * radius
            new_x = center_x + x_dis_new

            new_y = center_y - y_dis_new

            new_theta = (theta + beta) % (2*pi)
            
            new_particles.append((new_x, new_y, new_theta))
        return new_particles
        
        # move, and add randomness to the motion
    
    def Gaussian(mu, sigma, x):
        return exp(-((mu-x)**2) / (2*sigma**2) / 2.0) / sqrt(2.0*pi*(sigma**2))
    
    def measurement_prob(particle, measurement, sigma):
        x, y, _ = particle
        particle_measurement = get_theoretical_gravitational_force_at_point(x, y)
        return Gaussian(particle_measurement, sigma, measurement)
        
        # Combined weight (product of position and heading weights)
        # return gravity_weight * heading_weight
    # Initialize the particle filter
    if other is None:
        # Initialize particles with position and heading
        num_particles = 10000
        particles = []
        for _ in range(num_particles):
            x = random.uniform(-4 * AU, 4 * AU)
            y = random.uniform(-4 * AU, 4 * AU)
            heading = (atan2(y,x) + (pi/2)) % (2 * pi)
            particles.append((x, y, heading))
        other = {'particles': particles, 'weights': [1.0 / num_particles] * num_particles, 'N': num_particles, 'fuzz_percentage': 0.5, 'sigma': 1.0e-7}
    N = other['N']
    fuzz_percentage = other['fuzz_percentage']
    particles = other['particles'] #other['particles']
    
    start = time.time()
    # Update weights based on the gravimeter measurement
    w = []
    for i in range(N):
        w.append(measurement_prob(particles[i], gravimeter_measurement, other['sigma']))
    # print('Time to calculate weights:', time.time() - start)
    # Normalize weights
    total_weight = sum(w) + 1.0e-300
    w = [weight / total_weight for weight in w]
    # print(w)
    # print('Time to normalize weights:', time.time() - start)
    # Resample particles based on weights
    new_particles = []
    index = int(random.random() * N)
    beta = 0.0
    mw = max(w)
    for i in range(N):
        beta += random.random() * 2 * mw
        while beta > w[index]:
            beta -= w[index]
            index = (index + 1) % N
        new_particles.append(particles[index])
    # print('Time to resample:', time.time() - start)
    # Update the particles
    particles = new_particles
    
    # Fuzz a percentage of the particles to diversify the hypotheses
    num_fuzz = int(fuzz_percentage * N)
    for _ in range(num_fuzz):
        idx = random.randint(0, N - 1)
        x, y, theta = particles[idx]
        # Add Gaussian noise to the position and heading
        x += random.gauss(0, 1e-2 * AU)  
        y += random.gauss(0, 1e-2 * AU)
        theta += random.gauss(0, 0.001) 
        theta %= (2 * pi) 
        particles[idx] = (x, y, theta)
    # print('Time to fuzz:', time.time() - start)
    particles = move(particles, distance, steering)
    # print('Time to move:', time.time() - start)
    # Estimate the next position as the mean of the particles
    sum_x = [particles[i][0] for i in range(N)]
    sum_y = [particles[i][1] for i in range(N)]
    x_estimate = sum(x * y for x, y in zip(sum_x, w))
    y_estimate = sum(x * y for x, y in zip(sum_y, w))
    # print(x_estimate, y_estimate)
    # print('Time to estimate:', time.time() - start)
    other['particles'] = particles
    other['N'] = 2000
    other['fuzz_percentage'] = .9
    # print('')
    
    # Optional points to plot (for visualization)
    
    return (x_estimate, y_estimate), other, other['particles']
    

    # example of how to get the gravity magnitude at a point in the solar system:
    gravity_magnitude = get_theoretical_gravitational_force_at_point(-1*AU, 1*AU)

    # TODO - remove this canned answer which makes this template code
    # pass one test case once you start to write your solution....
    xy_estimate = (0,0) #(139048139368.39096, -2225218287.6720667)

    # You may optionally also return a list of (x,y,h) points that you would like
    # the PLOT_PARTICLES=True visualizer to plot for visualization purposes.
    # If you include an optional third value, it will be plotted as the heading
    # of your particle.
    optional_points_to_plot = [(1*AU, 1*AU), (2*AU, 2*AU), (3*AU, 3*AU)]  # Sample (x,y) to plot
    optional_points_to_plot = [(1*AU, 1*AU, 0.5), (2*AU, 2*AU, 1.8), (3*AU, 3*AU, 3.2)]  # (x,y,heading)

    return xy_estimate, other, other['particles']


def next_angle(solar_system, percent_illuminated_measurements, percent_illuminated_sense_func,
               distance, steering, other=None):
    """
    Gets the next angle at which to send out an sos message to the home planet,
    the last planet in the solar system.
    This is the function you will have to write for part B.
    :param solar_system: SolarSystem
        A model of the solar system containing the sun and planets as Bodys (contains positions, velocities, and masses)
        Planets are listed in order from closest to furthest from the sun
    :param percent_illuminated_measurements: List[float]
        A list of floating point number from 0 to 100 representing
        the measured percent illumination of each planet in order from closest to furthest to sun
        as seen by the target satellite.
    :param percent_illuminated_sense_func: Func
        A function that takes in (x,y) and outputs the list of percent illuminated measurements of each planet
        as would be seen by satellite at that (x,y) location.
    :param distance: float
        The target satellite's motion distance
    :param steering: float
        The target satellite's motion steering
    :param other: any
        This is initially None, but if you return an OTHER from
        this function call, it will be passed back to you the next time it is
        called, so that you can use it to keep track of important information
        over time. (We suggest you use a dictionary so that you can store as many
        different named values as you want.)
    :return:
        bearing: float. The absolute angle from the satellite to send an sos message between -pi and pi
        xy_estimate: Tuple[float, float]. The (x,y) estimate of the target satellite at the next timestep
        other: any. Any additional information you'd like to pass between invocations of this function
        optional_points_to_plot: List[Tuple[float, float, float]].
            A list of tuples like (x,y,h) to plot for the visualization
    """
    num_particles = 10000
    particles = []
    if other is None:
        # Initialize particles with position and heading
        for _ in range(num_particles):
            x = random.uniform(-4 * AU, 4 * AU)
            y = random.uniform(-4 * AU, 4 * AU)
            heading = (atan2(y,x) + (pi/2)) % (2 * pi)
            particles.append((x, y, heading))
        other = {'particles': particles, 'weights': [1.0 / num_particles] * num_particles, 'N': num_particles, 'fuzz_percentage': 0.5, 'sigma': 0.95}
    
    def sense(x,y):
        return percent_illuminated_sense_func(x,y)[-1]
    
    (x,y) , other, particles = estimate_next_pos(percent_illuminated_measurements[-1], sense, distance, steering, other)
    
    home = solar_system.move_body(solar_system.planets[-1])
    (home_x, home_y) = home.r

    # At what angle to send an SOS message this timestep
    bearing = atan2(home_y - y, home_x - x)

    return bearing, (x,y), other, particles


def who_am_i():
    # Please specify your GT login ID in the whoami variable (ex: jsmith125).
    whoami = 'nnegash6'
    return whoami