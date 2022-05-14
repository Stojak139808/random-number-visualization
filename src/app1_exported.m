classdef app1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        GridLayout                     matlab.ui.container.GridLayout
        LeftPanel                      matlab.ui.container.Panel
        DyskretnyrozkadprawdopodobiestwaLabel  matlab.ui.control.Label
        CigyrozkadprawdopodobiestwaLabel  matlab.ui.control.Label
        PlayButton_2                   matlab.ui.control.Button
        PlayButton                     matlab.ui.control.Button
        FunkcjaEditField               matlab.ui.control.EditField
        FunkcjaEditFieldLabel          matlab.ui.control.Label
        liczbaprzedziawEditField       matlab.ui.control.NumericEditField
        liczbaprzedziawEditFieldLabel  matlab.ui.control.Label
        LiczbalosowaEditField          matlab.ui.control.NumericEditField
        LiczbalosowaEditFieldLabel     matlab.ui.control.Label
        SeedEditField                  matlab.ui.control.NumericEditField
        SeedEditFieldLabel             matlab.ui.control.Label
        XEditField                     matlab.ui.control.EditField
        XEditFieldLabel                matlab.ui.control.Label
        YEditField                     matlab.ui.control.EditField
        YEditFieldLabel                matlab.ui.control.Label
        OpnienieLosowasEditFieldLabel  matlab.ui.control.Label
        OpnienieLosowasEditField       matlab.ui.control.NumericEditField
        RightPanel                     matlab.ui.container.Panel
        UIAxes                         matlab.ui.control.UIAxes
        UIAxes2                        matlab.ui.control.UIAxes
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: PlayButton
        function PlayButtonPushed(app, event)
            
            %w tej funkcji trzeba wygenerować animację ciągłej funkcji
            %gęstości
            
            %app.UIAxes2.XLim = app.UIAxes.XLim;
            animate_continous(app.FunkcjaEditField.Value, app.LiczbalosowaEditField.Value, app.liczbaprzedziawEditField.Value, app.SeedEditField.Value, app.UIAxes, app.UIAxes2, app.OpnienieLosowasEditField.Value);
            
        end

        % Button pushed function: PlayButton_2
        function PlayButton_2Pushed(app, event)
            
            %w tej funkcji trzeba wygenerować animację dyskretnej funkcji
            %gęstości
            %app.UIAxes2.XLim = app.UIAxes.XLim;
            animate_discrete(str2num(app.XEditField.Value)', str2num(app.YEditField.Value)', app.LiczbalosowaEditField.Value, app.SeedEditField.Value, app.UIAxes, app.UIAxes2, app.OpnienieLosowasEditField.Value);
            
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {583, 583};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {438, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 1164 583];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {438, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create DyskretnyrozkadprawdopodobiestwaLabel
            app.DyskretnyrozkadprawdopodobiestwaLabel = uilabel(app.LeftPanel);
            app.DyskretnyrozkadprawdopodobiestwaLabel.Position = [41 172 219 22];
            app.DyskretnyrozkadprawdopodobiestwaLabel.Text = 'Dyskretny rozkład prawdopodobieństwa';

            % Create CigyrozkadprawdopodobiestwaLabel
            app.CigyrozkadprawdopodobiestwaLabel = uilabel(app.LeftPanel);
            app.CigyrozkadprawdopodobiestwaLabel.Position = [41 350 202 26];
            app.CigyrozkadprawdopodobiestwaLabel.Text = 'Ciągły rozkład prawdopodobieństwa';

            % Create PlayButton_2
            app.PlayButton_2 = uibutton(app.LeftPanel, 'push');
            app.PlayButton_2.ButtonPushedFcn = createCallbackFcn(app, @PlayButton_2Pushed, true);
            app.PlayButton_2.Position = [318 50 100 22];
            app.PlayButton_2.Text = 'Play';

            % Create PlayButton
            app.PlayButton = uibutton(app.LeftPanel, 'push');
            app.PlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.PlayButton.Position = [318 238 100 22];
            app.PlayButton.Text = 'Play';

            % Create FunkcjaEditField
            app.FunkcjaEditField = uieditfield(app.LeftPanel, 'text');
            app.FunkcjaEditField.Position = [96 320 322 22];
            app.FunkcjaEditField.Value = '@(x)1/(3*sqrt(2*pi)) * exp(-0.5*((x-7)/3).^2)';

            % Create FunkcjaEditFieldLabel
            app.FunkcjaEditFieldLabel = uilabel(app.LeftPanel);
            app.FunkcjaEditFieldLabel.HorizontalAlignment = 'right';
            app.FunkcjaEditFieldLabel.Position = [33 320 48 22];
            app.FunkcjaEditFieldLabel.Text = 'Funkcja';

            % Create liczbaprzedziawEditField
            app.liczbaprzedziawEditField = uieditfield(app.LeftPanel, 'numeric');
            app.liczbaprzedziawEditField.Position = [150 282 267 22];
            app.liczbaprzedziawEditField.Value = 100;

            % Create liczbaprzedziawEditFieldLabel
            app.liczbaprzedziawEditFieldLabel = uilabel(app.LeftPanel);
            app.liczbaprzedziawEditFieldLabel.HorizontalAlignment = 'right';
            app.liczbaprzedziawEditFieldLabel.Position = [32 282 103 22];
            app.liczbaprzedziawEditFieldLabel.Text = 'liczba przedziałów';

            % Create LiczbalosowaEditField
            app.LiczbalosowaEditField = uieditfield(app.LeftPanel, 'numeric');
            app.LiczbalosowaEditField.Position = [262 524 150 22];
            app.LiczbalosowaEditField.Value = 1000;

            % Create LiczbalosowaEditFieldLabel
            app.LiczbalosowaEditFieldLabel = uilabel(app.LeftPanel);
            app.LiczbalosowaEditFieldLabel.HorizontalAlignment = 'right';
            app.LiczbalosowaEditFieldLabel.Position = [159 524 88 22];
            app.LiczbalosowaEditFieldLabel.Text = 'Liczba losowań';

            % Create SeedEditField
            app.SeedEditField = uieditfield(app.LeftPanel, 'numeric');
            app.SeedEditField.ValueDisplayFormat = '%.0f';
            app.SeedEditField.Position = [208 491 204 22];
            app.SeedEditField.Value = 12345678;

            % Create SeedEditFieldLabel
            app.SeedEditFieldLabel = uilabel(app.LeftPanel);
            app.SeedEditFieldLabel.HorizontalAlignment = 'right';
            app.SeedEditFieldLabel.Position = [159 491 34 22];
            app.SeedEditFieldLabel.Text = 'Seed';

            % Create XEditField
            app.XEditField = uieditfield(app.LeftPanel, 'text');
            app.XEditField.Position = [72 140 345 22];
            app.XEditField.Value = '1 2 3 4 5 6';

            % Create XEditFieldLabel
            app.XEditFieldLabel = uilabel(app.LeftPanel);
            app.XEditFieldLabel.HorizontalAlignment = 'right';
            app.XEditFieldLabel.Position = [33 140 25 22];
            app.XEditFieldLabel.Text = 'X';

            % Create YEditField
            app.YEditField = uieditfield(app.LeftPanel, 'text');
            app.YEditField.Position = [72 99 345 22];
            app.YEditField.Value = '1/6 1/6 1/6 1/6 1/6 1/6';

            % Create YEditFieldLabel
            app.YEditFieldLabel = uilabel(app.LeftPanel);
            app.YEditFieldLabel.HorizontalAlignment = 'right';
            app.YEditFieldLabel.Position = [33 99 25 22];
            app.YEditFieldLabel.Text = 'Y';

            % Create OpnienieLosowasEditFieldLabel
            app.OpnienieLosowasEditFieldLabel = uilabel(app.LeftPanel);
            app.OpnienieLosowasEditFieldLabel.HorizontalAlignment = 'right';
            app.OpnienieLosowasEditFieldLabel.Position = [164 448 134 22];
            app.OpnienieLosowasEditFieldLabel.Text = 'Opóźnienie Losowań [s]';

            % Create OpnienieLosowasEditField
            app.OpnienieLosowasEditField = uieditfield(app.LeftPanel, 'numeric');
            app.OpnienieLosowasEditField.Position = [312 448 100 22];
            app.OpnienieLosowasEditField.Value = 0.1;

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;

            % Create UIAxes
            app.UIAxes = uiaxes(app.RightPanel);
            title(app.UIAxes, 'Dystrybuanta i rozkład')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [13 299 671 278];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.RightPanel);
            title(app.UIAxes2, 'Wynik losowań')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.Position = [13 33 671 250];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end