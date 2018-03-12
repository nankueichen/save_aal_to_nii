function [Label2,Perc] = gin_det_plabels(XYZmm, MNID, ROI)
%
% Compute Labels and % for local maxima
% 
% 	XYZmm	: Local Maxima 
% 	MNID	: atlas volume with labels values
% 	ROI	: structure : link between labels values and label name.
% 	BORDER_XYZ	:  structure contains the regions edges in mm
% 	BORDER_V	:  structure contains the labels values
%
%	Label2 : Labels List found
%	Perc : Percent List of voxels belonging to Label2
%
%_______________________________________________________________________
%
% gin_det_plabels.m				B Landeau 20/02/02
%_______________________________________________________________________

% first part
% transformation from XYZmm coord to MNID volume coord
	mniXYZ   = MNID.mat \ [XYZmm; ones(1, size(XYZmm, 2))];
	MNIY     = spm_read_vols(MNID);
	for i=1:size(mniXYZ,2),
		%MNIV(i) = MNIY(mniXYZ(1,i),mniXYZ(2,i),mniXYZ(3,i));
		MNIV(i) = MNIY(round(mniXYZ(1,i)),round(mniXYZ(2,i)),round(mniXYZ(3,i)));
	end

% link labels values - labels
	nb_roi = length(ROI);
	for i=1:length(MNIV),
		Label(i).Nom =  'OUTSIDE';
		ID(i) = -1.0;
	end
	for i=1:nb_roi,
		tmp=find(MNIV==ROI(i).ID);
		if ~isempty(tmp)	
			for j=1:length(tmp),
				Label(tmp(j)).Nom = ROI(i).Nom_L;
				ID(tmp(j)) = ROI(i).ID;
			end
		end
	end
	
% sort labels
	[y,is] =sort(ID);
	Label1=Label(is);
	%Label1(:).Nom;

	[u,idx]=unique(y);
	Label2=Label1(idx);
	%Label2(:).Nom;

% sort %
	Perc(1)=(idx(1))/size(y,2)*100.0;
	for jj=2:size(u,2)
		Perc(jj)=(idx(jj)-idx(jj-1))/size(y,2)*100.0;
	end

	[Perc,inx]=sort(Perc);
	Label2=Label2(inx);

