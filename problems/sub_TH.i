[GlobalParams]
    initial_p = 1e5
    initial_vel = 0
    initial_T = 300

    rdg_slope_reconstruction = full
    closures = simple_closures
    fp = he
[]

[FluidProperties]
    [he]
        type = IdealGasFluidProperties
        molar_mass = 4e-3
        gamma = 1.67
        k = 0.2556
        mu = 3.22639e-5
    []
[]

[HeatStructureMaterials]
    [mat]
        type = SolidMaterialProperties
        rho = 2000
        k = 52
        cp = 0.47
    []
[]

[Closures]
    [simple_closures]
        type = Closures1PhaseSimple
    []
[]

[Components]
    [inlet]
        type = InletMassFlowRateTemperature1Phase
        input = 'core_chan:in'
        m_dot = 1e-4
        T = 300
    []
    [core_chan]
        type = FlowChannel1Phase
        position = '5 5 0'
        orientation = '0 0 1'
        length = 10
        n_elems = 20
        A = 0.785
        D_h = 1
        f = 1.6
    []
    [outlet]
        type = Outlet1Phase
        input = 'core_chan:out'
        p = 1e5
    []
    [core_ht]
        type = HeatTransferFromSpecifiedTemperature1Phase
        flow_channel = core_chan
        T_wall = 300
        Hw = 1.36
    []
[]

[Executioner]
    type = Transient
    start_time = 0
    end_time = 200
    dt = 1
  
    line_search = basic
    solve_type = NEWTON
  
    nl_rel_tol = 1e-5
    nl_abs_tol = 1e-5
    nl_max_its = 5
[]

[Outputs]
    exodus = true
[]


