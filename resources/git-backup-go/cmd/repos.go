package cmd

import (
	"context"
	"fmt"
	"github.com/urfave/cli/v3"
)

func ReposCommand() *cli.Command {
	return &cli.Command{
		Name:      "repos",
		Usage:     "List Git repositories of a registry",
		HideHelp:  true,
		ArgsUsage: "registry [options]",
		Flags: []cli.Flag{&cli.StringFlag{
			Name: "jq-expression",
			// backtick is used as the name of the variable
			Usage: "Set the `JQ_EXPRESSION` used to parse the JSON API response ",
			Action: func(ctx context.Context, command *cli.Command, v string) error {
				if v == "" {
					return cli.Exit("jq expression should not be empty", 1)
				}
				return nil
			},
		}},
		Action: ReposAction(),
	}
}

func ReposAction() func(c context.Context, command *cli.Command) error {
	return func(c context.Context, command *cli.Command) error {

		registry := command.Args().Get(0)
		if registry == "" {
			_ = cli.ShowSubcommandHelp(command)
			return cli.Exit("A registry argument should be given", 1)
		}
		fmt.Println(registry)

		return nil
	}
}
