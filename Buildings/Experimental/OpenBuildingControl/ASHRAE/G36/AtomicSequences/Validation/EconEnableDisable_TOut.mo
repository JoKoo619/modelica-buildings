within Buildings.Experimental.OpenBuildingControl.ASHRAE.G36.AtomicSequences.Validation;
model EconEnableDisable_TOut
  "Validation model for disabling the economizer if any of the freeze protection stages 1 through 3 are activated."
  extends Modelica.Icons.Example;

  parameter Real TOutAboveTreshold(min=297 + 1, max=350, unit="K", displayUnit="degC")=300 "Constant output value";

  EconEnableDisable econEnableDisable
    annotation (Placement(transformation(extent={{0,-12},{26,12}})));
  CDL.Continuous.Constant outDamPosMax(k=0.9)
    "Maximal allowed economizer damper position"
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  CDL.Continuous.Constant outDamPosMin(k=0.1)
    "Minimum allowed economizer damper position"
    annotation (Placement(transformation(extent={{-80,-74},{-60,-54}})));
  CDL.Continuous.Constant TOut(k=TOutAboveTreshold)
    "Outdoor air temperature, constant below example 75 F"
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));

  CDL.Continuous.ConstantStatus freezeProtectionStage(refSta=Buildings.Experimental.OpenBuildingControl.CDL.Types.Status.FreezeProtectionStage0)
    "None of the Stages 1 through 3 is activated"
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
equation
  connect(outDamPosMax.y, econEnableDisable.uOutDamPosMin) annotation (Line(
        points={{-59,-30},{-36,-30},{-36,-4},{-2.6,-4}},  color={0,0,127}));
  connect(outDamPosMin.y, econEnableDisable.uOutDamPosMax) annotation (Line(
        points={{-59,-64},{-32,-64},{-32,-9.33333},{-2.6,-9.33333}},
                                                          color={0,0,127}));
  connect(TOut.y, econEnableDisable.TOut) annotation (Line(points={{-59,70},{
          -26,70},{-26,9.33333},{-2.6,9.33333}},
                                          color={0,0,127}));
  //fixme - turn into proper test and uncomment
  //__Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Experimental/OpenBuildingControl/ASHRAE/G36/Validation/fixme.mos"
  //     "Simulate and plot"),
  connect(freezeProtectionStage.y, econEnableDisable.uFreezeProtectionStatus)
    annotation (Line(points={{-59,30},{-30,30},{-30,4},{-2.6,4}},
                                                                color={255,85,
          85}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent={{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points={{-36,58},{64,-2},{-36,-62},{-36,58}})}), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
  experiment(StopTime=1800.0),
    Documentation(info="<html>
<p>
This example validates
<a href=\"modelica://Buildings.Experimental.OpenBuildingControl.ASHRAE.G36.EconEnableDisable\">
Buildings.Experimental.OpenBuildingControl.ASHRAE.G36.EconEnableDisable</a>
for different control signals.
</p>
</html>", revisions="<html>
<ul>
<li>
March 31, 2017, by Milica Grahovac:<br/>
First implementation.
</li>
</ul>
</html>"));
end EconEnableDisable_TOut;