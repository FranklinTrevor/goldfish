[Mesh]
    type = GeneratedMesh
    dim = 2
    nx = 20
    ny = 20
    xmax = 10
    ymax = 10
[]

[Variables]
    [Temp]
    []
[]

[Kernels]
    [heat_conduction]
        type = ADHeatConduction
        variable = Temp
    []
    [time_derivative]
        type = ADHeatConductionTimeDerivative
        variable = Temp
        specific_heat = 0.47 #J/kg-C
        density_name = 8000 #Kg/m^3
    []
[]

[Materials]
    [heat_conduction]
        type = ADHeatConductionMaterial
        thermal_conductivity = 52 #W/m-k
    []
[]
  
[BCs]
    [t_wall]
        type = DirichletBC
        variable = Temp
        value = 600
        boundary = 'bottom top left right'
    []
[]

[Executioner]
    type = Transient
    end_time = 300
    dt = 1
    solve_type = 'NEWTON'
[]

[MultiApps]
    [thm]
        type = TransientMultiApp
        input_files = sub_TH.i
        execute_on = 'TIMESTEP_END'
        positions = '5 5 0'
    []
[]

[Transfers]
    [push_T]
        type = MultiAppNearestNodeTransfer
        to_multi_app = thm
        source_variable = Temp
        variable = T_wall
    []
[]

[Outputs]
    exodus = true
[]