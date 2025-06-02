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

WEIGHTS = [0.82, 0.13, 0.05]

def pid_thrust(target_elevation, drone_elevation, tau_p=0, tau_d=0, tau_i=0, data: dict() = {}):
    '''
    Student code for Thrust PID control. Drone's starting x, y position is (0, 0).

    Args:
    target_elevation: The target elevation that the drone has to achieve
    drone_elevation: The drone's elevation at the current time step
    tau_p: Proportional gain
    tau_i: Integral gain
    tau_d: Differential gain
    data: Dictionary that you can use to pass values across calls.
        Reserved keys:
            max_rpm_reached: (True|False) - Whether Drone has reached max RPM in both its rotors.

    Returns:
        Tuple of thrust, data
        thrust - The calculated change in thrust using PID controller
        data - A dictionary containing any values you want to pass to the next
            iteration of this function call.
            Reserved keys:
                max_rpm_reached: (True|False) - Whether Drone has reached max RPM in both its rotors.
    '''

    thrust = 0

    return thrust, data


def pid_roll(target_x, drone_x, tau_p=0, tau_d=0, tau_i=0, data:dict() = {}):
    '''
    Student code for PD control for roll. Drone's starting x,y position is 0, 0.

    Args:
    target_x: The target horizontal displacement that the drone has to achieve
    drone_x: The drone's x position at this time step
    tau_p: Proportional gain, supplied by the test suite
    tau_i: Integral gain, supplied by the test suite
    tau_d: Differential gain, supplied by the test suite
    data: Dictionary that you can use to pass values across calls.

    Returns:
        Tuple of roll, data
        roll - The calculated change in roll using PID controller
        data - A dictionary containing any values you want to pass to the next
            iteration of this function call.

    '''

    roll = 0

    return roll, data


def find_parameters_thrust(run_callback, tune='thrust', DEBUG=False, VISUALIZE=False):
    '''
    Student implementation of twiddle algorithm will go here. Here you can focus on
    tuning gain values for Thrust test cases only.

    Args:
    run_callback: A handle to DroneSimulator.run() method. You should call it with your
                PID gain values that you want to test with. It returns an error value that indicates
                how well your PID gain values followed the specified path.

    tune: This will be passed by the test harness.
            A value of 'thrust' means you only need to tune gain values for thrust.
            A value of 'both' means you need to tune gain values for both thrust and roll.

    DEBUG: Whether or not to output debugging statements during twiddle runs
    VISUALIZE: Whether or not to output visualizations during twiddle runs

    Returns:
        tuple of the thrust_params, roll_params:
            thrust_params: A dict of gain values for the thrust PID controller
              thrust_params = {'tau_p': 0.0, 'tau_d': 0.0, 'tau_i': 0.0}

            roll_params: A dict of gain values for the roll PID controller
              roll_params   = {'tau_p': 0.0, 'tau_d': 0.0, 'tau_i': 0.0}

    '''

    # Initialize a list to contain your gain values that you want to tune
    p = [0.,0.,0.]
    dp = [1.,1.,0.]
    
    def callback(p):
        hover_error, max_allowed_velocity, drone_max_velocity, max_allowed_oscillations, total_oscillations = run_callback(thrust_params= {'tau_p': p[0], 'tau_d': p[1], 'tau_i': p[2]})
        velocity_error = abs(max_allowed_velocity - drone_max_velocity)
        oscillations_error = abs(max_allowed_oscillations - total_oscillations)
        return WEIGHTS[0] * hover_error + WEIGHTS[1] * velocity_error + WEIGHTS[2] * oscillations_error
    
    best_error = callback(p)
    
    while sum(dp) > 0.001:
        for i in range(len(p)):
            p[i] += dp[i]
            error = callback(p)
            if error < best_error:
                best_error = error
                dp[i] *= 1.1
            else:
                p[i] -= 2*dp[i]
                error = callback(p)
                if error < best_error:
                    best_error = error
                    dp[i] *= 1.1
                else:
                    p[i] += dp[i]
                    dp[i] *= 0.9

    # Create dicts to pass the parameters to run_callback
    thrust_params = {'tau_p': params[0], 'tau_d': params[1], 'tau_i': params[2]}

    # If tuning roll, then also initialize gain values for roll PID controller
    roll_params   = {'tau_p': 0, 'tau_d': 0, 'tau_i': 0}

    # Call run_callback, passing in the dicts of thrust and roll gain values
    hover_error, max_allowed_velocity, drone_max_velocity, max_allowed_oscillations, total_oscillations = run_callback(thrust_params, roll_params, VISUALIZE=VISUALIZE)

    # Calculate best_error from above returned values
    best_error = None

    # Implement your code to use twiddle to tune the params and find the best_error

    # Return the dict of gain values that give the best error.

    return thrust_params, roll_params

def find_parameters_with_int(run_callback, tune='thrust', DEBUG=False, VISUALIZE=False):
    '''
    Student implementation of twiddle algorithm will go here. Here you can focus on
    tuning gain values for Thrust test case with Integral error

    Args:
    run_callback: A handle to DroneSimulator.run() method. You should call it with your
                PID gain values that you want to test with. It returns an error value that indicates
                how well your PID gain values followed the specified path.

    tune: This will be passed by the test harness.
            A value of 'thrust' means you only need to tune gain values for thrust.
            A value of 'both' means you need to tune gain values for both thrust and roll.

    DEBUG: Whether or not to output debugging statements during twiddle runs
    VISUALIZE: Whether or not to output visualizations during twiddle runs

    Returns:
        tuple of the thrust_params, roll_params:
            thrust_params: A dict of gain values for the thrust PID controller
              thrust_params = {'tau_p': 0.0, 'tau_d': 0.0, 'tau_i': 0.0}

            roll_params: A dict of gain values for the roll PID controller
              roll_params   = {'tau_p': 0.0, 'tau_d': 0.0, 'tau_i': 0.0}

    '''

    # Initialize a list to contain your gain values that you want to tune, e.g.,
    params = [0,0,0]

    def callback(p):
        hover_error, max_allowed_velocity, drone_max_velocity, max_allowed_oscillations, total_oscillations = run_callback(thrust_params= {'tau_p': p[0], 'tau_d': p[1], 'tau_i': p[2]})
        velocity_error = abs(max_allowed_velocity - drone_max_velocity)
        oscillations_error = abs(max_allowed_oscillations - total_oscillations)
        return WEIGHTS[0] * hover_error + WEIGHTS[1] * velocity_error + WEIGHTS[2] * oscillations_error

    best_error = callback(p)

    while sum(dp) > 0.001:
        for i in range(len(p)):
            p[i] += dp[i]
            error = callback(p)
            if error < best_error:
                best_error = error
                dp[i] *= 1.1
            else:
                p[i] -= 2*dp[i]
                error = callback(p)
                if error < best_error:
                    best_error = error
                    dp[i] *= 1.1
                else:
                    p[i] += dp[i]
                    dp[i] *= 0.9

    # Create dicts to pass the parameters to run_callback
    thrust_params = {'tau_p': params[0], 'tau_d': params[1], 'tau_i': params[2]}

    # If tuning roll, then also initialize gain values for roll PID controller
    roll_params   = {'tau_p': 0, 'tau_d': 0, 'tau_i': 0}

    # Call run_callback, passing in the dicts of thrust and roll gain values
    hover_error, max_allowed_velocity, drone_max_velocity, max_allowed_oscillations, total_oscillations = run_callback(thrust_params, roll_params, VISUALIZE=VISUALIZE)

    # Calculate best_error from above returned values
    best_error = None

    # Implement your code to use twiddle to tune the params and find the best_error

    # Return the dict of gain values that give the best error.

    return thrust_params, roll_params

def find_parameters_with_roll(run_callback, tune='both', DEBUG=False, VISUALIZE=False):
    '''
    Student implementation of twiddle algorithm will go here. Here you will
    find gain values for Thrust as well as Roll PID controllers.

    Args:
    run_callback: A handle to DroneSimulator.run() method. You should call it with your
                PID gain values that you want to test with. It returns an error value that indicates
                how well your PID gain values followed the specified path.

    tune: This will be passed by the test harness.
            A value of 'thrust' means you only need to tune gain values for thrust.
            A value of 'both' means you need to tune gain values for both thrust and roll.

    DEBUG: Whether or not to output debugging statements during twiddle runs
    VISUALIZE: Whether or not to output visualizations during twiddle runs

    Returns:
        tuple of the thrust_params, roll_params:
            thrust_params: A dict of gain values for the thrust PID controller
              thrust_params = {'tau_p': 0.0, 'tau_d': 0.0, 'tau_i': 0.0}

            roll_params: A dict of gain values for the roll PID controller
              roll_params   = {'tau_p': 0.0, 'tau_d': 0.0, 'tau_i': 0.0}

    '''
    # Initialize a list to contain your gain values that you want to tune, e.g.,
    p = [0.,0.,0.,0.,0.,0.]
    dp = [1.,1.,0.,1.,1.,0.]
    
    def callback(p):
        hover_error, max_allowed_velocity, drone_max_velocity, max_allowed_oscillations, total_oscillations = run_callback(thrust_params= {'tau_p': p[0], 'tau_d': p[1], 'tau_i': p[2]}, roll_params= {'tau_p': p[3], 'tau_d': p[4], 'tau_i': p[5]})
        velocity_error = abs(max_allowed_velocity - drone_max_velocity)
        oscillations_error = abs(max_allowed_oscillations - total_oscillations)
        return WEIGHTS[0] * hover_error + WEIGHTS[1] * velocity_error + WEIGHTS[2] * oscillations_error
    
    best_error = callback(p)
    
    while sum(dp) > 0.001:
        for i in range(len(p)):
            p[i] += dp[i]
            error = callback(p)
            if error < best_error:
                best_error = error
                dp[i] *= 1.1
            else:
                p[i] -= 2*dp[i]
                error = callback(p)
                if error < best_error:
                    best_error = error
                    dp[i] *= 1.1
                else:
                    p[i] += dp[i]
                    dp[i] *= 0.9

    # Create dicts to pass the parameters to run_callback
    thrust_params = {'tau_p': params[0], 'tau_d': params[1], 'tau_i': params[2]}

    # If tuning roll, then also initialize gain values for roll PID controller
    roll_params   = {'tau_p': p[3], 'tau_d': p[4], 'tau_i': p[5]}

    # # Call run_callback, passing in the dicts of thrust and roll gain values
    # hover_error, max_allowed_velocity, drone_max_velocity, max_allowed_oscillations, total_oscillations = run_callback(thrust_params, roll_params, VISUALIZE=VISUALIZE)

    # Call run_callback, passing in the dicts of thrust and roll gain values
    hover_error, max_allowed_velocity, drone_max_velocity, max_allowed_oscillations, total_oscillations = run_callback(thrust_params, roll_params, VISUALIZE=VISUALIZE)

    # Calculate best_error from above returned values
    best_error = None

    # Implement your code to use twiddle to tune the params and find the best_error

    # Return the dict of gain values that give the best error.

    return thrust_params, roll_params

def who_am_i():
    # Please specify your GT login ID in the whoami variable (ex: jsmith224).
    whoami = ''
    return whoami
