function fig = aal()
% ___________________________________________________________________________
% Main Interface for AUTOMATED ANATOMICAL LABELING procedures used with spm2:
% Local Maxima Labeling : gin_dlabels.m
% Extended Local Maxima Labeling : gin_rclusters.m
% Cluster Labeling : gin_clusters.m
% Each procedure needs Functional Maps spacially normalized 
% using the MNI template.
%
% Copyright 2003 Groupe d'Imagerie Fonctionnelle
% Reference NeuroImage 15, 273-289, (2003)
% 
% v1.0 Brigitte Landeau	09/09/03
% ___________________________________________________________________________

h0 = figure('Color',[1 1 1], ...
	'PaperPosition',[18 180 576 432], ...
	'PaperUnits','points', ...
	'Position',[350 250 390 210], ...
	'Tag','Main', ...
	'NumberTitle','off',...
	'Name','ToolBox : GIN, UMR 6095 (2003)', ...
	'MenuBar','none', ...
	'ToolBar','none');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.7020 0.6072 0.3014], ...
	'Position',[72 85 166 16], ...
	'String','Local Maxima Labeling', ...
	'CallBack','gin_dlabels;');
h2 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.7020 0.6072 0.3014], ...
	'Position',[72 60 166 16], ...
	'String','Extended Local Maxima Labeling', ...
	'CallBack','gin_rclusters;');
h3 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.7020 0.60720 0.30140], ...
	'Position',[72 35 166 16], ...
	'String','Cluster Labeling', ...
	'CallBack','gin_clusters;');
h4 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.7020 0.60720 0.30140], ...
	'Position',[72 10 166 16], ...
	'String','Quit', ...
	'CallBack','delete(gcf), spm(''Clear'')');
h5 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',15, ...
	'ListboxTop',0, ...
	'Position',[16 136 280 16], ...
	'String','AUTOMATED ANATOMICAL LABELING', ...
	'Style','text', ...
	'Tag','StaticText5');
if nargout > 0, fig = h0; end
