            %% VAS rating main script
%% A.G. Mitchell - 25.02.2022
% Developed from code by Camila Deolindo & Francesca Fardo

% Last edit - 08.03.2022

% Helpers required: 
        

%% Load parameters
VAS_loadParams;
addpath helperFunctions % getting helper functions to path, just incase they are not already added (make sure they are in the same folder)

% Reseed the random-number generator
SetupRand;

vars.control.devFlag  = 0; % Development flag 1. Set to 1 when developing the task, will optimize stim size for laptop, not hide cursor

%% Psychtoolbox settings
PsychDefaultSetup(2);
Screen('Preference', 'SkipSyncTests', 2);
scr.ViewDist = vars.ViewDist; % viewing distance
[scr, keys] = ptbConfig(scr, vars);

%% Prepare to start
%  try
% Set text size, dependent on screen resolution
if any(logical(scr.winRect(:)>3000))       % 4K resolution
    scr.TextSize = 65;
else
    scr.TextSize = vars.instructions.textSize;
end
    % Check if window is already open (if not, open screen window) 
    [scr]=openScreen(scr);
    
    % Dummy calls to prevent delays
    vars.control.RunSuccessfull = 0;
    vars.control.Aborted = 0;
    vars.control.Error = 0;
    vars.control.thisTrial = 1;
    vars.control.abortFlag = 0;
    [~, ~, keys.KeyCode] = KbCheck;

for trial_idx=1:vars.task.NTrialsTotal
    %% Open start screen
    % to control when each trial starts - can remove this if VAS questions
    % need to be continuous  

    %% to consider:
    % having a 'TGI countdown' where button is pressed at the beginning of
    % TGI stimulation that counts down 15s, before participants can rate
    % VAS
    Screen('TextSize', scr.win, scr.TextSize);
    DrawFormattedText(scr.win, vars.instructions.StartVas, 'center', 'center', scr.TextColour);
    [~, ~] = Screen('Flip', scr.win);
    KbStrokeWait;

    % run countdown during TGI stimulation
    StimCount(scr, vars);  

    %% Run VAS
    % Will loop through the number of VAS questions
    % for each trial (both params are set in VAS_load.params.m)
    % Currently set to 3 VAS questions - burning, warm, cold
    % this is used to index which question was addressed in output (see
    % VAS_loadParams.m for details)
    randQuestion = vars.instructions.QuestionCode(randperm(length(vars.instructions.whichQuestion)));

    Screen('TextSize', scr.win, scr.TextSize); % resetting text size
    for rand_idx=1:length(randQuestion)
        question_type_idx = randQuestion(rand_idx);
        [Results.vasResponse(trial_idx, question_type_idx), ...
            Results.vasReactionTime(trial_idx, question_type_idx)] = ...
            getVasRatings(keys, scr, vars, question_type_idx); 
        % making sure that VAS ratings are saved in correct column for each
        % question (sanity check)
        Results.QuestionType(trial_idx, question_type_idx) = vars.instructions.Question(question_type_idx); 
    end 

    % display thermode switch text - atm not needed
    %if trial_idx == vars.instructions.ThermodeSwitch(trial_idx)
    %    DrawFormattedText(scr.win, vars.instructions.Thermode, 'center', 'center', scr.TextColour);
    %    [~, ~] = Screen('Flip', scr.win);
    %    KbStrokeWait;
    %end
end

sca;