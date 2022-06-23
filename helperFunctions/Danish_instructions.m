%% Instructions for VAS_run.m in Danish
% JF Ehmsen, DE Christensen
% 23.06.22
%% Variables
vars.instructions.StartScreen = ['For hver runde vil du m�rke termisk stimulation.\n\n' ...
    'I starten af hver stimulation og runde, bedes du vurdere den mest intense br�ndende f�lelese du\n' ...
    'm�rker fra enten holder A eller B p� en skala fra 0 - 100.\n\n' ...
    'Efter dette, skal du vurdere hvor br�ndende, varm og kold som holder A eller B er,\n' ...
    'p� en skala fra 0 - 100.\n\n' ...
    '0 betyder at det ikke f�les br�ndende/varmt/koldt, og 100 betyder at det f�les ekstremt br�ndende/varmt/koldt.\n'...
    'Venligst brug hele skalaen, og svar 0, hvis du ikke f�ler noget af det ovenst�ende.\n\n'...
    'Det er vigtigt at du vurderer den f�lelse du f�ler i det sekund du svarer, fra den holder\n'...
    'som du specifikt er blevet instrueret i at skulle have fokus p� af forskningsassistenten.\n\n' ...
    'N�r du er klar, tryk p� en vilk�rlig tast for at g� i gang.'];

vars.instructions.StartVas = ['Efter instruks af forskningsassistenten, tryk p� en tast, for at starte med at vurdere.\n\n' ...
    'N�r du er f�rdig, tryk p� MELLEMRUM, for at forts�tte til n�ste vurdering.'];

vas.instructions.Calib = ['Du skal nu, vurdere hvor meget stimulationen f�les BR�NDENDE.\n\n' ...
    'Du bedes svare �rligt og giv enhver tilbagemelding vedr�rende din oplevelse/f�lelse til assistenten.'];

vars.instructions.Question = {'P� nuv�rende tidpsunkt, hvor st�rk er den st�rkeste BR�NDENDE f�lelse?',...
                               'P� nuv�rende tidpsunkt, hvor BR�NDENDE f�les stimulutionen?',...
                               'P� nuv�rende tidpsunkt, hvor VARM f�les stimulutionen?',...
                               'P� nuv�rende tidpsunkt, hvor KOLD f�les stimulutionen?' }; 
                           
vars.instructions.QuestionCode = [1 2 3 4]; % 1 - initial burn, 2 - burning, 3 - warm, 4 - cold
vars.instructions.whichQuestion = [1 1 1 1]; %Enable or disable question (1 = enabled) %% not sure this works, needs fixing!

vars.instructions.whichKey = {'LR','UD'}; % Left/Right. Up/Down. If you are using the mouse as an input device let this entirely as LR
      
vars.instructions.ThermodeSwitch = 2:vars.task.NTrialsChange:(vars.task.NBlocksTotal*16); %When to ask participant to change thermode position (starting from 2)
vars.instructions.Thermode = 'Vent venligst, imens vi rykker rundt p� apparatet. Tryk p� en tast, n�r det er gjort.';

vars.instructions.ConfEndPoints = {'Overhovedet ikke', 'Ekstremt'};    
%% Waiting during stimulation
vars.waitStim.text = 'N�r nedt�llingen slutter, bedes du vurdere din oplevelse/f�lelse. Tryk MELLEMRUM, n�r det er gjort.';
vars.waitStim.secs = 10; %the number of seconds you want to stimulate TGI for
vars.waitStim.textSize = 65;