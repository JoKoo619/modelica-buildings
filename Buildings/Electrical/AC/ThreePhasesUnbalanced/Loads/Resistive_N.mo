within Buildings.Electrical.AC.ThreePhasesUnbalanced.Loads;
model Resistive_N "Model of a resistive load with neutral cable"
  extends BaseClasses.PartialLoad_N(
    redeclare Buildings.Electrical.AC.OnePhase.Loads.Resistive load1,
    redeclare Buildings.Electrical.AC.OnePhase.Loads.Resistive load2,
    redeclare Buildings.Electrical.AC.OnePhase.Loads.Resistive load3);
equation

  annotation (Icon(graphics={      Rectangle(extent={{-100,100},{100,-100}},
            lineColor={255,255,255}),
          Rectangle(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
          origin={7.10543e-15,7.10543e-15},
          rotation=180),
          Line(points={{-6.85214e-44,-8.39117e-60},{12,1.46953e-15}},
                                       color={0,0,0},
          origin={-80,0},
          rotation=180),
          Line(points={{-6.85214e-44,-8.39117e-60},{18,2.20429e-15}},
                                       color={0,0,0},
          origin={-80,0},
          rotation=180),
        Text(
          extent={{-114,116},{126,76}},
          lineColor={0,120,120},
          textString="%name"),
        Line(
          points={{-66,50},{-26,50}},
          color={0,0,0},
          smooth=Smooth.None),
        Rectangle(
          extent={{-11,30},{11,-30}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={4,49},
          rotation=90),
        Line(
          points={{34,50},{54,50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{54,50},{70,0},{54,-50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{34,0},{70,0}},
          color={0,0,0},
          smooth=Smooth.None),
        Rectangle(
          extent={{-11,30},{11,-30}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={4,1},
          rotation=90),
        Line(
          points={{-66,0},{-26,0}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-66,-50},{-26,-50}},
          color={0,0,0},
          smooth=Smooth.None),
        Rectangle(
          extent={{-11,30},{11,-30}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={4,-49},
          rotation=90),
        Line(
          points={{34,-50},{54,-50}},
          color={0,0,0},
          smooth=Smooth.None)}), Documentation(revisions="<html>
<ul>
<li>
August 27, 2014, by Marco Bonvini:<br/>
Revised documentation.
</li>
</ul>
</html>", info="<html>
<p>
This model represents a three phases unbalanced resistive load.
The model extends from 
<a href=\"modelica://Buildings.Electrical.AC.ThreePhasesUnbalanced.Loads.BaseClasses.PartialLoad_N\">
Buildings.Electrical.AC.ThreePhasesUnbalanced.Loads.BaseClasses.PartialLoad_N</a>
and uses the load model from the package
<a href=\"modelica://Buildings.Electrical.AC.OnePhase.Loads\">
Buildings.Electrical.AC.OnePhase.Loads</a>. The model is able to provide detailed
information about the actual voltages, currents and powers on each phase.
</p>
<p>
This model has a connector with four cable and it does represent the neutral cable.
The current in the neutral cable is computed as the algebraic sum of the currents
of the loads.
</p>
<p>
For more information see <a href=\"modelica://Buildings.Electrical.AC.ThreePhasesUnbalanced.Loads.BaseClasses.PartialLoad_N\">
Buildings.Electrical.AC.ThreePhasesUnbalanced.Loads.BaseClasses.PartialLoad_N</a> and 
<a href=\"modelica://Buildings.Electrical.AC.OnePhase.Loads.Resistive\">
Buildings.Electrical.AC.OnePhase.Loads.Resistive</a>.
</p>
</html>"));
end Resistive_N;