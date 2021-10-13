
using AnyMOD, Gurobi


# create model
anyM = anyModel("testModel1","results")
createOptModel!(anyM)
setObjective!(:costs,anyM)

# analyze created model
plotTree(:region,anyM)
plotEnergyFlow(:graph,anyM)

# solve model
set_optimizer(anyM.optModel,Gurobi.Optimizer) # select a solver
optimize!(anyM.optModel) # solve the model

# analyze results
reportResults(:summary,anyM)
reportTimeSeries(:electricity, anyM)

# create sankey plots
plotEnergyFlow(:sankey,anyM)


