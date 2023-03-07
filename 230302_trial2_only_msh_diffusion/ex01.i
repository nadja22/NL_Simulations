[Mesh]
  # We use a pre-generated mesh file (in exodus format).
  # This mesh file has 'top' and 'bottom' named boundaries defined inside it.
  file = 230220_trial1.msh
[]

[Variables]
  [./diffused]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  [./diff]
    type = Diffusion
    variable = diffused
  [../]
[]

[BCs]
  [./5] # arbitrary user-chosen name
    type = DirichletBC
    variable = diffused
    boundary = '5' # outer box (surrounding rock)
    value = 1
  [../]

  [./4] # arbitrary user-chosen name
    type = DirichletBC
    variable = diffused
    boundary = '4' # air
    value = 1
  [../]
  
    [./3] # arbitrary user-chosen name
    type = DirichletBC
    variable = diffused
    boundary = '3' # clay cap
    value = 0
  [../]

    [./2] # arbitrary user-chosen name
    type = DirichletBC
    variable = diffused
    boundary = '2' # resistive reservoir
    value = 0
  [../]

    [./1] # arbitrary user-chosen name
    type = DirichletBC
    variable = diffused
    boundary = '1' # magma chamber
    value = 0
  [../]
[]

[Executioner]
  type = Steady
  solve_type = 'PJFNK'
[]

[Outputs]
  execute_on = 'timestep_end'
  exodus = true
[]
