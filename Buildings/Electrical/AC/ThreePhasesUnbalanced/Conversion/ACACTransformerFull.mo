within Buildings.Electrical.AC.ThreePhasesUnbalanced.Conversion;
model ACACTransformerFull
  extends
    Buildings.Electrical.AC.ThreePhasesUnbalanced.Conversion.BaseClasses.PartialConverter(
    redeclare Buildings.Electrical.AC.OnePhase.Conversion.ACACTransformerFull conv1(
      VHigh=VHigh/sqrt(3),
      VLow=VLow/sqrt(3),
      VABase=VABase,
      R1=R1,L1=L1,R2=R2,L2=L2,
      magEffects=magEffects,
      Rm=Rm,Lm=Lm,
      ground_1=ground_1,
      ground_2=ground_2),
    redeclare Buildings.Electrical.AC.OnePhase.Conversion.ACACTransformerFull conv2(
      VHigh=VHigh/sqrt(3),
      VLow=VLow/sqrt(3),
      VABase=VABase,
      R1=R1,L1=L1,R2=R2,L2=L2,
      magEffects=magEffects,
      Rm=Rm,Lm=Lm,
      ground_1=ground_1,
      ground_2=ground_2),
    redeclare Buildings.Electrical.AC.OnePhase.Conversion.ACACTransformerFull conv3(
      VHigh=VHigh/sqrt(3),
      VLow=VLow/sqrt(3),
      VABase=VABase,
      R1=R1,L1=L1,R2=R2,L2=L2,
      magEffects=magEffects,
      Rm=Rm,Lm=Lm,
      ground_1=ground_1,
      ground_2=ground_2));

  parameter Modelica.SIunits.Voltage VHigh
    "Rms voltage on side 1 of the transformer (primary side)";
  parameter Modelica.SIunits.Voltage VLow
    "Rms voltage on side 2 of the transformer (secondary side)";
  parameter Modelica.SIunits.ApparentPower VABase
    "Nominal power of the transformer";
  parameter Modelica.SIunits.Frequency f(start=60) "Nominal frequency";
  parameter Buildings.Electrical.Types.PerUnit R1(min=0)
    "Resistance on side 1 of the transformer (pu)";
  parameter Buildings.Electrical.Types.PerUnit L1(min=0)
    "Inductance on side 1 of the transformer (pu)";
  parameter Buildings.Electrical.Types.PerUnit R2(min=0)
    "Resistance on side 2 of the transformer (pu)";
  parameter Buildings.Electrical.Types.PerUnit L2(min=0)
    "Inductance on side 2 of the transformer (pu)";
  parameter Boolean magEffects = false
    "If =true introduce magnetization effects"
    annotation(Dialog(group="Magnetization"));
  parameter Buildings.Electrical.Types.PerUnit Rm(min=0)
    "Magnetization resistance (pu)" annotation(Dialog(group="Magnetization", enable = magEffects));
  parameter Buildings.Electrical.Types.PerUnit Lm(min=0)
    "Magnetization inductance (pu)" annotation(Dialog(group="Magnetization", enable = magEffects));
  parameter Boolean ground_1 = false "Connect side 1 of converter to ground" annotation(Dialog(tab = "Ground", group="side 1"));
  parameter Boolean ground_2 = true "Connect side 2 of converter to ground" annotation(Dialog(tab = "Ground", group="side 2"));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(graphics={
        Text(
          extent={{-100,-60},{100,-92}},
          lineColor={0,120,120},
          textString="%name"),
        Text(
          extent={{-130,60},{-70,20}},
          lineColor={11,193,87},
          textString="1"),
        Text(
          extent={{-130,100},{-70,60}},
          lineColor={11,193,87},
          textString="AC"),
        Text(
          extent={{70,100},{130,60}},
          lineColor={0,120,120},
          textString="AC"),
        Text(
          extent={{70,60},{130,20}},
          lineColor={0,120,120},
          textString="2"),
        Line(
          points={{-80,-40},{-120,-40}},
          color=DynamicSelect({0,120,120}, if ground_1 then {0,120,120} else {
              255,255,255}),
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-80,-40},{-106,-14}},
          color=DynamicSelect({0,120,120}, if ground_1 then {0,120,120} else {255,
              255,255}),
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-102,-16},{-114,-24},{-118,-42}},
          color=DynamicSelect({0,120,120}, if ground_1 then {0,120,120} else {
              255,255,255}),
          smooth=Smooth.Bezier),
        Line(
          points={{80,-40},{120,-40}},
          color=DynamicSelect({0,120,120}, if ground_2 then {0,120,120} else {
              255,255,255}),
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{80,-40},{106,-14}},
          color=DynamicSelect({0,120,120}, if ground_2 then {0,120,120} else {
              255,255,255}),
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{102,-16},{114,-24},{118,-42}},
          color=DynamicSelect({0,120,120}, if ground_2 then {0,120,120} else {
              255,255,255}),
          smooth=Smooth.Bezier),
        Line(
          points={{-72,40},{-66,40},{-64,44},{-60,36},{-56,44},{-52,36},{-48,44},
              {-44,36},{-42,40},{-38,40}},
          color={0,127,127},
          smooth=Smooth.None),
          Line(
          points={{-6.85214e-44,-8.39117e-60},{-60,-7.34764e-15}},
          color={0,127,127},
          origin={-40,40},
          rotation=180),
        Ellipse(
          extent={{-30,46},{-18,34}},
          lineColor={0,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-18,46},{-6,34}},
          lineColor={0,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-6,46},{6,34}},
          lineColor={0,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-30,40},{6,28}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(
          points={{20,40},{20,20}},
          color={0,127,127},
          smooth=Smooth.None),
        Ellipse(
          extent={{14,20},{26,8}},
          lineColor={0,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{14,8},{26,-4}},
          lineColor={0,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{14,-4},{26,-16}},
          lineColor={0,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{10,20},{20,-16}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(
          points={{20,-16},{20,-40}},
          color={0,127,127},
          smooth=Smooth.None),
        Line(
          points={{20,-40},{-70,-40}},
          color={0,127,127},
          smooth=Smooth.None),
        Line(
          points={{34,40},{34,20}},
          color={0,127,127},
          smooth=Smooth.None),
        Ellipse(
          extent={{40,20},{28,8}},
          lineColor={0,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{40,8},{28,-4}},
          lineColor={0,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{40,-4},{28,-16}},
          lineColor={0,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{44,20},{34,-16}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(
          points={{34,-16},{34,-40}},
          color={0,127,127},
          smooth=Smooth.None),
        Line(
          points={{70,-40},{34,-40}},
          color={0,127,127},
          smooth=Smooth.None),
        Line(
          points={{70,40},{34,40}},
          color={0,127,127},
          smooth=Smooth.None),
        Text(
          extent={{-64,60},{-48,48}},
          lineColor={0,120,120},
          textString="R"),
        Text(
          extent={{-20,60},{-4,48}},
          lineColor={0,120,120},
          textString="L")}));
end ACACTransformerFull;