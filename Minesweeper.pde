import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS = 20;
public final static int NUM_COLS = 20;
public final static int NUM_BOMBS = 10;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList <MSButton>(); //ArrayList of just the minesweeper buttons that are mined
void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //your code to declare and initialize buttons goes here
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for(int r = 0; r < NUM_ROWS; r++)
    {
        for(int c = 0; c < NUM_COLS; c++)
            buttons[r][c] = new MSButton(r,c);
    }
    setBombs();
}
public void setBombs()
{
    while(bombs.size() < NUM_BOMBS)
    {
        int r = (int)(Math.random()*NUM_ROWS);
        int c = (int)(Math.random()*NUM_COLS);
        if(!bombs.contains(buttons[r][c]))
              bombs.add(buttons[r][c]);
        System.out.println(r+","+c);
    }
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        if(isValid(r,c-1) || isValid(r,c+1) ||isValid(r-1,c) ||isValid(r+1,c) ||isValid(r-1,c-1) ||isValid(r+1,c-1) ||isValid(r+1,c+1)||isValid(r-1,c+1))
            numBombs++;
        return numBombs;
    }
    public void mousePressed () 
    {
        clicked = true;
        if(keyPressed = true)
            marked=isMarked();
            if(marked=false)
                clicked=false;
        else if(bombs.contains(this))
            displayLosingMessage();
        //else if()
            //label=;
        else
            mousePressed();
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        if(r>0 && r<=20)
        {
            if(c>0 && c<=20)
                return true;
        }
        return false;
    }
}
