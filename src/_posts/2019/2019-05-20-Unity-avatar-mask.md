---
published: true
layout: post
title: Unity Avatar Mask
categories: Tutorial
tags: unity3d animation avatarmask
---
In this tutorial we will learn how to use [Avatar Mask](https://docs.unity3d.com/Manual/AnimationMaskOnImportedClips.html) and [Animation Layers]() to combine multiple animations.

## Introduction
To start, lets see what Unity Manaul says about Avatar Masks and Animation Layers.

[Avatar Masks](https://docs.unity3d.com/Manual/AnimationMaskOnImportedClips.html):
> Masking allows you to discard some of the animation data within a clip, **allowing the clip to animate only parts of the object or character rather than the entire thing**. For example, if you had a character with a throwing animation. If you wanted to be able to **use the throwing animation in conjunction with various other body movements such as running, crouching and jumping**, you could create a mask for the throwing animation limiting it to just the right arm, upper body and head. This portion of the animation can then be played in a layer over the top of the base running or jumping animations.

[Animation Layers](https://docs.unity3d.com/Manual/AnimationLayers.html)
> Unity uses Animation Layers for managing complex state machines for different body parts. An example of this is if you have a lower-body layer for walking-jumping, and an upper-body layer for throwing objects / shooting.

Reading those two above sections is quite clear that we need to use avatar masks and animation layers together to combine our animations of differente body parts.

## The problem
Imagine we have imported an animated 3D model from Asset Store, in our sample we will use the amazing robot from the free package [Sci Fi Warrior PBR HP](https://assetstore.unity.com/packages/3d/characters/humanoids/sci-fi-warrior-pbr-hp-106154) by [Dungeon Mason](https://assetstore.unity.com/publishers/23554).
In this package there are 10 animation clips:

{% screenshot animation-clips.png %}

All those clips are animations for full body. So, when you play:

**Idle_GunMiddle**
{% screenshot Idle_GunMiddle.png %}
{% caption the robot stands idle with the gun in the middle of his body %}

#### Shoot_Auto
{% screenshot Shoot_Auto.png %}
{% caption the robot stands and shoot the gun in the auto-mode %}

#### WalkForward_Shoot
{% screenshot WalkForward_Shoot.png %}
{% caption the robot walk forward and shoot %}

These are great animations, but if **you want to make the robot stands idle, but instead of keeping the gun in the middle of his body, he aims the gun or shooting the gun?**

Or **if you want that robot walk forward but holding the gun in the middle of his body?**

Of course, you can ask to the animator to create all those animation combinations, but there is a smarter approach for this case: **use Avatar Masks and Animation Layers**.

## Starter project
{% logo project.png default %}

All the source code and assets for this tutorial are available on this GitHub repository: [https://github.com/giacomelli/unity-animation-mask](https://github.com/giacomelli/unity-animation-mask). To start this tutorial you need to fork, clone or download the repository.

```shell
git clone https://github.com/giacomelli/unity-animation-mask.git
```

Open the folder "avatar-mask-starter" on Unity.
> This starter project has a initial setup and assets to allow us focus in the learning about Avatar Masks and Animations Layers.

Open the scene "_Tutorial/Scenes/TutorialScene". 

> If you see a popup called "TMP importer", hit the "Import TPM Essentials" button to import the TextMesh Pro's assets.

Hit the "Play" button. You should see a screen like the screenshot below:

{% screenshot starter-project.png %}
{% caption Starter project running: buttons as no actions yet %}

## Creating the Animation Controller

Create a new "Animation Controller" (menu "Assets/Create/Animation Controller") and open it:

{% screenshot animator-window-empty.png %}
{% caption Animator window showing the animation controller created %}

All animation layers, nodes and transitions for this tutorial will be created inside this animation controller.

In the hierarchy, select the SciFiWarriorHP and in the Animator component set the "Controller" property to our Animation Controller.

## Making the robot walk forward
To get something running right now, we will make the robot walk forward when the button "WALK / FORWARD" became checked.

In the Animator opening with our Animation Controller drag the animation clip "Idle_GunMiddle" from folder "SciFiWarrior/Animations". Do the same with the clip "WalkForward_Shoot".

Create a [transation](https://docs.unity3d.com/Manual/class-Transition.html) (right click on node and  "Make transition") from "Any state" to "WalkForward_Shoot" and create another transition from "WalkForward_Shoot" to "Idle_GunMiddle".

Now we need to tell to the animation controller when it should activate the two transations, for this we will create a bool [animation parameter](https://docs.unity3d.com/Manual/AnimationParameters.html) called "WalkForward".

{% screenshot animation-parameter.png %}

We want to activate the transation from "Any state" to "WalkForward_Shoot" when "WalkForward" is true, so select this transition and in its "Conditions" list on inspector add the "WalkForward" equals  "true":

{% screenshot walk-forward-condition.png %}

Click the "reset" to auto fit the exit and transitiont time:
{% screenshot reset-transtion.png %}

Do the same to the transition from "WalkForward_Shoot" to "Idle_GunMiddle", but use "false" as the value for "WalkForward".

Hit the "Play" button to test the animation states. When you click on "WALK / FORWARD" the robot starts to walk, when you click it again the robot stops to walk.


### Creating the upper body avatar mask
The animation for walk forward works pretty well, the robot walk forward while it's aiming the gun. This is the whole movement animated inside the "WalkForward_Shoot" clip. 

Now we want that robot walk forward without aiming the gun, instead of this we want it keeps the gun in the middle as it does when "Idle_GunMiddle" is active. To get this done, first we need to create an avatar mask to upper body.

Create a new Avatar Mask (Assets/Create/Avatar Mask) called "UpperBody". In the inspector, unckeck all lower body parties, as the image below:
{% screenshot upper-body-avatar-mask.png %}

### Creating a upper body animation layer
With the UpperBody Avatar Mask created, we will need to create a new animation layer that will use the mask. Go to the animator window and create a new layer using the "+ button":
{% screenshot upperbody-animation-layer %}
{% caption the new layer created with the mask %}

Change the "Weight" property to 1 and set the Mask to the UpperBody Avatar Mask. Keep the "Blending" as override.

Drag the animation clip "Idle_GunMiddle" from folder "SciFiWarrior/Animations" to the "UpperBody" layer.


Hit the "Play" button to test the animation states. When you click on "WALK / FORWARD" the robot starts to walk, but now it's not aiming the gun, instead it keeps the gun in the middle.

Why this happens? So, this is done by the UpperBody Animation Layer that we added to our animation controller, as it's mask was defined with our UpperBody Animation Mask that only consider upper body parts of the humanoid, Unity overrides the base layer animation with the upper body part of the "Idle_GunMiddle".




### Creating the right leg avatar mask
### Creating the left leg avatar mask

## Creating an Euclidean distance chromosome
{% screenshot chromosome.png %}

Chromosome is the representation of a possible solution in genetic algoritms.

In GeneticSharp a chromosome needs to implement the [IChromosome](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Chromosomes/IChromosome.cs) interface, but in most of cases you just need to inherit the [ChromosomeBase](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Chromosomes/ChromosomeBase.cs) class and override the methods GenerateGene and CreateNew.

Besides IChromosome and ChromosomeBase also exist the classes: [BinaryChromosomeBase](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Chromosomes/BinaryChromosomeBase.cs), [FloatingPointChromosome](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Chromosomes/FloatingPointChromosome.cs) and [IntegerChromosome](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Chromosomes/IntegerChromosome.cs) that are chromosome classes that can be directly used when your solution chromosome can be represented as numbers or a string representation of 0 and 1.

In our case we need to create a chromosome that represent the input variables of the Euclidean distance function: X1, Y1 and X2, Y2. 

The FloatingPointChromosome is a perfect fit for this kind of representation, because it allows represent more than one number inside of it.

Open the Program.cs file and inside the Main function enter the code below:

{% gist b6861313762464fe62b652ef7d03b91c CreatingAnEuclideanDistanceChromsome.cs %}

In the code above we create two variables to represent our rectangle area size: maxWidth and maxHeight, then we created a new instance of FloatingPointChromome, this will be the template to all chromsome in our solution.

The constructor receive four arrays, they are:

1) The minimum values of numbers inside the chromosome. Our rectangle area will start at 0 points, so the min value of X1, Y1, X2 and Y2 are 0 (zero).

2) The maximum values. We use our previous created variables.

3) The total bits used to represent each number. The maximum value is 998, so 10 bits is what we need. 

> GeneticSharp will warn you if you try to use a total bits that cannot hold a number inside your floating point chromosome.

4) The number of fraction (scale or decimal) part of the number. In our case we will not use any.

## Creating the population
{% screenshot population.png %}

The population represents the possible solutions to our problem, so we need to create a population of our Euclidean distance chromosome.

In GeneticSharp a population is represented by the [IPopulation](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Populations/IPopulation.cs) interface, but in most cases you can directly use the [Population](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Populations/Population.cs) class.

{% gist b6861313762464fe62b652ef7d03b91c CreatingThePopulation.cs %}

We created a population that will have a minimum number of 50 chromosomes and a maximum number of 100 and used our chromosome template as the "Adam chromosome" (yeah, you get the reference) of our GA.

## Creating the fitness function
{% screenshot score.png %}

The fitness function is where the genetic algoritm will evaluate and give a value (fitness) to each chromosome generated inside it. A good fitness function can guide your GA to a fast and optimum solution.

In GeneticSharp we represent a fitness function through the [IFitness](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Fitnesses/IFitness.cs) interface. Almost always you wil have to code a class that implement this interface, but for our tutorial we can use the simple and lower friction class [FuncFitness](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Fitnesses/FuncFitness.cs). This class allow us to build our fitness evalution as its constructor argument.

{% gist b6861313762464fe62b652ef7d03b91c CreatingTheFitnessFunction.cs %}

We receive a IChromosome in the variable "c", then we cast it to FloatingPointChromosme.

To allow us to evaluate the chromosome we need to convert it from its genotype (FloatingPointChromosome) to its phenotype (x1, y1 and x2, y2), we do this calling the ToFloatingPoints method. This method return an array of numbers using that configuration we used when we created our Euclidean distance chromosome. Now we have our X1, Y1 and X2 and Y2 numbers we just need to pass it to the Euclidean distance function and return the value as the fitness value of the current chromosome.

## Creating the selection
{% screenshot podium.png %}

A selection is the genetic algorithm operator responsible for decing which chromosomes of current population will be selected as parent of the next population.

You can code your our selection through the [ISelection](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Selections/ISelection.cs) interface or extending the [SelectionBase](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Selections/SelectionBase.cs) class.

Besides this, you can use the already implemented classic selections: [Elite](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Selections/EliteSelection.cs), [Roulete Wheel](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Selections/RouletteWheelSelection.cs), [Stochastic Universal Sampling](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Selections/StochasticUniversalSamplingSelection.cs) and [Tournament](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Selections/TournamentSelection.cs).

{% gist b6861313762464fe62b652ef7d03b91c CreatingTheSelection.cs %}

Elite selection is a good option, because it will select the chromosomes with the best fitness (greatest distance). You can try the others selection options too and see how they change the GA speed and results.

## Creating the crossover
{% screenshot cross.png %}

The chromosomes selected by the selection need to cross to generate new possible solutions of the next generation of the GA. The crossover operator is responsible for crossing these selected chromosomes.

There are the [ICrossover](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/ICrossover.cs) interface and [CrossoverBase](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/CrossoverBase.cs) class if you want to code your crossover from scratch or you can use one of already available: [Cut and Splice](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/CutAndSpliceCrossover.cs), [Cycle (CX)](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/CycleCrossover.cs), [One-Point (C1)](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/OnePointCrossover.cs), [Order-based (OX2)](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/OrderBasedCrossover.cs), [Ordered (OX1)](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/OrderedCrossover.cs), [Partially Mapped (PMX)](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/PartiallyMappedCrossover.cs), [Position-based (POS)](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/PositionBasedCrossover.cs), [Three parent](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/ThreeParentCrossover.cs), [Two-Point (C2)](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/TwoPointCrossover.cs) and [Uniform](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Crossovers/UniformCrossover.cs)

> Some of those classics crossovers, like OX1 and OX2, cannot be used in our tutorial because they need chromosomes with ordered genes and this is not the case of our chromosomes with 0101001100 genes. Do not worry, because GeneticSharp will warn you if you try to use an invalid chromosome in an ordered crossover

{% gist b6861313762464fe62b652ef7d03b91c CreatingTheCrossover.cs %}

Uniform Crossover enables the parent chromosomes to contribute the gene level rather than the segment level, for example: if the mix probability is 0.5, the offspring has approximately half of the genes from first parent and the other half from second parent.

So, in our case Uniform crossover is a very good option, because using the 0.5f mix probability it will generate new chromosomes that are combination of X1, Y1 from one parent and X2, Y2 from another parent.

## Creating the mutation
{% screenshot mutation.png %}

The biology definition of mutations is: 
*"In genetics, mutation may be small scale (affecting a gene) or large scale (involving a change in the chromosome). It may arise from faulty deletions, insertions, or exchanges of the genetic material. Such a change may result in the creation of a new character or trait."* 

This biological process is one of the process responsible for I am able to write this tutorial and you be able read it. Without mutation, our species might have been found an local optima and perhaps we would never have evolved into what we are now.

The mutation operator has the same purpose in genetic algorithm, it avoid that our GA get stuck in optima local and end up never finding a better solution.

Like the other operators, you can create your own mutation implementing the [IMutation](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Mutations/src/GeneticSharp.Domain/Mutations/IMutation.cs) interface or extending [MutationBase](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Mutations/src/GeneticSharp.Domain/Mutations/MutationBase.cs) or use some from the GeneticSharp menu: [Flip-bit](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Mutations/src/GeneticSharp.Domain/Mutations/FlipBitMutation.cs), [Reverse Sequence (RSM)](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Mutations/src/GeneticSharp.Domain/Mutations/ReverseSequenceMutation.cs), [Twors](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Mutations/src/GeneticSharp.Domain/Mutations/TworsMutation.cs) and [Uniform](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Mutations/src/GeneticSharp.Domain/Mutations/UniformMutation.cs).

{% gist b6861313762464fe62b652ef7d03b91c CreatingTheMutation.cs %}

Flip-bit mutation is a mutation specific to chromosomes that implement [IBinaryChromosome](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Chromosomes/IBinaryChromosome.cs) interface, as our FloatingPointChromosome does. It will randomly chose a gene and flip it bit, so a gene with value 0 will turn to 1 and vice-versa.

## Creating the termination
{% screenshot end.png %}

A termination decide when a GA should be stopped. GeneticSharp use the generation number termination with just one generation as default termination. This mean that the genetic algoritm will run just one generation when you call the Start method, after this you can increment the expected generation number of the termination and call the method Resume how many times you want.

There are cases where you want to call the Start method in just wait until some condition be reached, this why termination exist.

If you have some special condition to terminate your GA you can implement the [ITermination](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Terminations/src/GeneticSharp.Domain/Terminations/ITermination.cs) interface or extend the [TerminationBase](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Terminations/src/GeneticSharp.Domain/Terminations/TerminationBase.cs) class, but for most of cases you just need to use some of the availables terminations: [Generation number](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Terminations/src/GeneticSharp.Domain/Terminations/GenerationNu), [Time evolving](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Terminations/src/GeneticSharp.Domain/Terminations/TimeEvolvingTermination.cs), [Fitness stagnation](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Terminations/src/GeneticSharp.Domain/Terminations/FitnessStagnationTermination.cs), [Fitness threshold](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Terminations/src/GeneticSharp.Domain/Terminations/FitnessThresholdTermination.cs), [And](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Terminations/src/GeneticSharp.Domain/Terminations/AndTermination.cs) e [Or](https://github.com/giacomelli/GeneticSharp/blob/master/src/GeneticSharp.Domain/Terminations/src/GeneticSharp.Domain/Terminations/OrTermination.cs) (allows combine others terminations).

{% gist b6861313762464fe62b652ef7d03b91c CreatingTheTermination.cs %}

In our tutorial we will use the fitness stagnation termination with a expected stagnant generations number of 100, this mean that if our GA generate the same best chromsome fitness in the last 100 generations then it will be terminated. 

## Running the GA
{% screenshot running.png %}

Now that everything is set up, we just need to instantiate and start our genetic algorithm and watch it run.

{% gist b6861313762464fe62b652ef7d03b91c RunningtheGA1.cs %}

So the GA ran, but where is the result? You can always get the best chromosome from the GeneticAlgorithm.BestChromosome property.

Another and better way to monitor the current best chromosome is use the GeneticAlgorithm.GenerationRan event. This event is raised right after a generation finish to run. Using this event you can see in 
realtime how the genetic algorithm is evolving.

Let's replace our last "ga.Start();" line to the code below:

{% gist b6861313762464fe62b652ef7d03b91c RunningtheGA2.cs %}

Now if your run the program you will see an output like that:

```
Generation  1: (178,330),(974,228) = 802.508566932466
Generation  2: (950,487),(45,520) = 905.601457596
Generation  3: (935,103),(38,617) = 1033.83025686038
Generation  4: (998,680),(49,65) = 1130.85189127489
Generation  8: (998,680),(57,1) = 1160.39734573981
Generation  9: (998,680),(49,1) = 1166.89416829462
Generation 11: (998,680),(17,19) = 1182.91250733095
Generation 12: (998,680),(25,3) = 1185.35142468384
Generation 14: (998,680),(17,3) = 1191.92701118819
Generation 16: (998,680),(17,1) = 1193.06412233375
Generation 17: (998,680),(16,1) = 1193.88651051932
Generation 23: (998,680),(0,1) = 1207.08119030991
Generation 32: (998,680),(0,0) = 1207.6439872744
```
If we plot these generations the output image will be like this:
{% screenshot GeneticSharpFunctionOptimizatonPlot.png %}

We can see that in the first generations (black lines) the genetic algorithm as some intermediate results and at the end (red line) **it found the best possible solution: a diagonal.**

## Complete source code
{% screenshot programmer.png %}

When you finish the tutorial your source code will be this one:

{% gist b6861313762464fe62b652ef7d03b91c CompleteSourceCode.cs %}

## Conclusion
{% screenshot conclusion.png %}

In this tutorial we learn how genetic algoritm works and how to use GeneticSharp to solve a very simple sample. Now you can try it to solve more complex problems.

Let's evolve!
<br><br><br>


<div>Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> and <a href="http://www.flaticon.com/authors/vignesh-oviyan" title="Vignesh Oviyan">Vignesh Oviyan</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
