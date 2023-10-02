package step.learning.IOC;

import com.google.inject.AbstractModule;
import step.learning.services.db.DbProvider;
import step.learning.services.db.LocalDbProvider;


public class ServiceConfig extends AbstractModule {
    @Override
    protected void configure() {
        // bind( DbProvider.class ).to( PlanetDbProvider.class ) ;
        bind( DbProvider.class ).to( LocalDbProvider.class ) ;
    }
}
